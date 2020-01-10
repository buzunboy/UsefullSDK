//
//  CoreDataManager.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 16.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit
import CoreData

/**
 Handles all jobs of the Core Data communication.
 */
public class CoreDataManager {
    
    // MARK: - Properties
    /// Singletion instance of the service.
    public static let shared = CoreDataManager()
            
    /// Returns `NSManagedObjectContext` from the AppDelegate entity.
    /// In the `AppDelegate` set `AppDelegate.persistentContainer.viewContext` to here.
    public var context: NSManagedObjectContext?
    
    /// Private initializer.
    private init() {
        
    }
    
    // MARK: - Public Methods

    /**
     Saves specified type of object to database.
     - parameter element: The element desired to save
     - parameter type: Do not use that parameter
     - returns: `true` if operation completed successfuly.
     */
    @discardableResult
    public func save<T>(_ element: T, type: T.Type = T.self) -> Bool where T: EntitySaveable {
        LoggingManager.methodStarted()
        defer {
            LoggingManager.methodFinished()
        }
        if let uniqueId = element.uniqueAttribute, let results = self.results(for: type) {
            if results.filter({ uniqueId == $0.uniqueAttribute! }).count > 0 {
                LoggingManager.info(message: "Element is already saved into DB with unique ID: \(uniqueId) - Ignoring", domain: .db)
                return false
            }
        }
        
        guard let context = self.context else {
            LoggingManager.error(message: "Couldn't find context", domain: .db)
            return false
        }
        let saveObject = NSEntityDescription.insertNewObject(forEntityName: type.entityName, into: context)
        for attribute in element.attributes {
            saveObject.setValue(attribute.value, forKey: attribute.key)
        }
        
        let result = self.saveContext(type)
        return result
    }

    /**
     Updates element in the database.
     This method doesn't save element if not found in the database, if `saveIfNotFound` is not true.
     - parameter element: The element desired to update
     - parameter type: Do not use that parameter
     - returns: `true` if updated successfuly.
     */
    @discardableResult
    public func update<T>(_ element: T, saveIfNotFound: Bool = false, type: T.Type = T.self) -> Bool where T: EntitySaveable {
        LoggingManager.methodStarted()
        var retVal = false
        defer {
            LoggingManager.methodFinished()
        }
        
        if element.uniqueAttribute != nil, let key = type.uniqueAttributeKey {
            if let result = self.entityResults(for: type)?.filter({ element.uniqueAttribute == ($0.value(forKey: key) as? AnyHashable)}).first {
                for attribute in element.attributes {
                    result.setValue(attribute.value, forKey: attribute.key)
                }
                retVal = self.saveContext(type)
            } else if saveIfNotFound {
                retVal = self.save(element, type: type)
            }
        } else {
            LoggingManager.error(message: "Unique Attribute not specified for element: \(element)", domain: .db)
        }
        
        LoggingManager.methodFinished()
        return retVal
    }
    

    /**
     Deletes specified element from the database.
     - parameter element: The element desired to update
     - parameter type: Do not use that parameter
     - returns: `true` if deleted successfuly.
     */
    @discardableResult
    public func delete<T>(_ element: T, type: T.Type = T.self) -> Bool where T: EntitySaveable {
        LoggingManager.methodStarted()
        var retVal = false
        defer {
            LoggingManager.methodFinished()
        }
        
        guard let context = self.context else {
            LoggingManager.error(message: "Couldn't find context", domain: .db)
            return false
        }
        
        if element.uniqueAttribute != nil, let key = type.uniqueAttributeKey {
            self.entityResults(for: type)?.filter({ element.uniqueAttribute == ($0.value(forKey: key) as? AnyHashable)}).forEach({ (object) in
                context.delete(object)
            })
            retVal = self.saveContext(type)
        } else {
            LoggingManager.error(message: "Unique Attribute not specified for element: \(element)", domain: .db)
        }
        
        LoggingManager.methodFinished()
        return retVal
    }

    /**
     Returns results for the specified element type
     - parameter entity: Type of the element
     - returns: Elements that have same type with the specified parameter.
     */
    public func results<T>(for entity: T.Type) -> [T]? where T: EntitySaveable {
        LoggingManager.methodStarted()
        var retVal: [T]?
        
        defer {
            LoggingManager.methodFinished()
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity.entityName)
        request.returnsObjectsAsFaults = false
        
        guard let context = self.context else {
            LoggingManager.error(message: "Couldn't find context", domain: .db)
            return nil
        }
        
        do {
            let results = try context.fetch(request)
            var resultArray = [T]()
            for result in (results as! [NSManagedObject]) {
                resultArray.insert(T.init(managedObject: result))
            }
            retVal = (resultArray.count > 0) ? resultArray : nil
        } catch {
            LoggingManager.error(message: "Couldn't get results for entityName: \(entity.entityName) - Error: \(error.localizedDescription)", domain: .db)
        }
        
        return retVal
    }
    
    // MARK: - Helpers
    /// Returns NSManagedObject results for the given type of entity.
    private func entityResults<T>(for entity: T.Type) -> [NSManagedObject]? where T: EntitySaveable {
        LoggingManager.methodStarted()
        var retVal: [NSManagedObject]?
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity.entityName)
        request.returnsObjectsAsFaults = false
        
        defer {
            LoggingManager.methodFinished()
        }
        
        guard let context = self.context else {
            LoggingManager.error(message: "Couldn't find context", domain: .db)
            return nil
        }
        
        do {
            let results = try context.fetch(request)
            retVal = (results.count > 0) ? (results as? [NSManagedObject]) : nil
        } catch {
            LoggingManager.error(message: "Couldn't get results for entityName: \(entity.entityName) - Error: \(error.localizedDescription)", domain: .db)
        }
        
        return retVal
    }

    /**
     Saves context into the CoreData
     - parameter objectType: Type of the object that makes final change on the context.
     - returns: Returns `true` if context have changes and saved successfuly.
     */
    @discardableResult
    private func saveContext<T>(_ objectType: T.Type) -> Bool where T: EntitySaveable {
        LoggingManager.methodStarted()
        var retVal = false
        do {
            if self.context?.hasChanges ?? false {
                try context?.save()
                retVal = true
                LoggingManager.verbose(message: "Context has saved", domain: .db)
                NotificationCenter.default.post(name: .DBUpdateNotification, object: objectType, userInfo: nil)
            } else {
                LoggingManager.verbose(message: "No changes found in the context - Ignoring", domain: .db)
            }
        } catch {
            LoggingManager.error(message: "Couldn't save the context - Error:\(error.localizedDescription)", domain: .db)
        }
        
        LoggingManager.methodFinished()
        return retVal
    }
    
}

/**
 Objects that conform `EntitySaveable` can be consumed by the CoreDataManager.
 */
public protocol EntitySaveable: class {
    /// Name of the `table` in the CoreData
    static var entityName: String { get }
    /// Specify `uniqueAttribute` value to help Database check uniqueness of the elements.
    var uniqueAttribute: AnyHashable? { get }
    /// Specify `uniqueAttribute` key to help Database check uniqueness of the elements.
    static var uniqueAttributeKey: String? { get }
    /// All attributes desired to save into database object.
    var attributes: [String:Any] { get }
    /// You should construct class when that initializer is called.
    init?(managedObject: NSManagedObject)
}

extension Notification.Name {
    /// Custom Notification name to notify observers when database is updated.
    static let DBUpdateNotification = Notification.Name("DBUpdateNotification")
}

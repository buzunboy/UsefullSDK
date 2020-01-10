//
//  LoggingManager.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 16.09.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import Foundation

public class LoggingManager {
    
    /// Logs from the all services of the `UsefullSDK` can be listened from setting a delegate to `LoggingManager`.
    class var delegate: LoggingDelegate? {
        set { LoggingManager.sharedInstance.logDelegate = newValue }
        get { return LoggingManager.sharedInstance.logDelegate }
    }
    
    private weak var logDelegate: LoggingDelegate?
    
    /// Singleton instance of the service.
    private static var sharedInstance = LoggingManager()
    
    /// Available domain types for the logs.
    public enum DomainType: Int {
        /// app domain
        case app
        /// view domain
        case view
        /// layout domain
        case layout
        /// controller domain
        case controller
        /// routing domain
        case routing
        /// service domain
        case service
        /// network domain
        case network
        /// data model domain
        case model
        /// cache domain
        case cache
        /// database domain
        case db
        /// input/output domain
        case io
    }
    
    /// Available log levels.
    public enum LevelType: String {
        /// minimum level of logs
        case verbose
        /// standard level of logs
        case info
        /// warning level
        case warning
        /// level for error logs
        case error
    }
    
    /// Private initializer
    private init() {
    }
    
    /**
     Logs info message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func info(message: String, domain: LoggingManager.DomainType, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .info, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs warning message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func warning(message: String, domain: LoggingManager.DomainType, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .warning, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs error message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func error(message: String, domain: LoggingManager.DomainType, function: String = #function, line: Int = #line,
                            file: String = #file,
                            tracking: (code: Int, name: String)? = nil) {
        LoggingManager.sharedInstance.log(message: message, level: .error, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs verbose message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func verbose(message: String, domain: LoggingManager.DomainType, function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: message, level: .verbose, domain: domain, function: function, line: line, file: file)
    }
    
    /**
     Logs `Method started` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func methodStarted(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Method started", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs `function called` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func methodCalled(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Function called", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs `Method Finished` message
     - parameter message: Message for the log
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public class func methodFinished(function: String = #function, line: Int = #line, file: String = #file) {
        LoggingManager.sharedInstance.log(message: "Method finished", level: .verbose, domain: .app, function: function, line: line, file: file)
    }
    
    /**
     Logs message
     - parameter message: Message for the log
     - parameter level: Loglevel
     - parameter domain: Domain information for the log
     - parameter function: Function that calls the log
     - parameter line: Line number that calls the code in execution
     - parameter file: File of the code that calls the log
     */
    public func log(message: String, level: LoggingManager.LevelType, domain: LoggingManager.DomainType, function: String = #function, line: Int = #line, file: String = #file) {
        let fileName = file.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? ""
        LoggingManager.sharedInstance.logDelegate?.log(message: message, level: level,
                                                       domain: domain,
                                                       source: "\(fileName).\(function).\(line)")
    }
}

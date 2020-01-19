//
//  UIImage+Data.swift
//  
//
//  Created by Burak Uzunboy on 19.01.20.
//

import UIKit

public extension UIImage {
    class func color(withData data:Data) -> UIImage {
         return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIImage
    }

    func encode() -> Data {
         return NSKeyedArchiver.archivedData(withRootObject: self)
    }
}


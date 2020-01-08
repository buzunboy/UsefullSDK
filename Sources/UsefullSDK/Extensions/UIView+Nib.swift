//
//  UIView+Nib.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 14.08.19.
//  Copyright © 2019 Burak Uzunboy. All rights reserved.
//

import UIKit

public extension UIView {
    
    /// Creates views from the Nib files if they have same name with their classes.
    class func create<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}

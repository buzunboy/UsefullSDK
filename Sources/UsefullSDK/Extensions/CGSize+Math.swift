//
//  CGSize+Math.swift
//  DCA_iOS
//
//  Created by Burak Uzunboy on 11.10.19.
//  Copyright © 2019 Exozet. All rights reserved.
//

import UIKit

public extension CGSize {
    
    /// Reduces the width and height with the given amount.
    static func - (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width - rhs, height: lhs.height - rhs)
    }
    
    /// Increases the width and height with the given amount.
    static func + (lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width + rhs, height: lhs.height + rhs)
    }
    
}

public extension CGPoint {
    
    /// Increases the X and Y points with the given amount
    static func + (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
    }
    
    /// Reduces the X and Y points with the given amount
    static func - (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
    }
    
    /// Adds two point.
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    /// Reduces the point with the given point.
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
}

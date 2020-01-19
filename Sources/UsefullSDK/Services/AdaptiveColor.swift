//
//  AdaptiveColor.swift
//  
//
//  Created by Burak Uzunboy on 18.01.20.
//

import UIKit

/// Adaptive Color that adapts given color according to the screen brightness changes.
@objc public class AdaptiveColor: NSObject {
    
    var hue: CGFloat, brightness: CGFloat, saturation: CGFloat, alpha: CGFloat
    private var callback: ColorUpdateCallback
    
    public typealias ColorUpdateCallback = ((_ color: UIColor)->())
    
    /// Cannot be used
    private override init() {
        fatalError("Use init:color instead")
    }
    
    @objc public init(color: UIColor, callback: @escaping ColorUpdateCallback) {
        self.hue = 0
        self.brightness = 0
        self.saturation = 0
        self.alpha = 0
        color.getHue(&hue, saturation: &saturation,
                     brightness: &brightness, alpha: &alpha)
        self.callback = callback
        super.init()
    }
    
    /// Creates adaptive color with the given `UIColor`.
    /// - Parameters:
    ///   - color: Base color for the object
    ///   - callback: Will be called when any screen brightness changes notified.
    @objc static public func color(from color: UIColor, callback: @escaping ColorUpdateCallback) {
        
    }
    
    private func initialize() {
        NotificationCenter.default.addObserver(self, selector: #selector(didScreenBrightnessChanged),
                                               name: UIScreen.brightnessDidChangeNotification, object: nil)
        self.didScreenBrightnessChanged()
    }

    @objc private func didScreenBrightnessChanged() {
        let screenBrightness = UIScreen.main.brightness
        
        let newColor = UIColor(hue: self.hue, saturation: self.saturation, brightness: screenBrightness, alpha: self.alpha)
        self.callback(newColor)
    }
    
}

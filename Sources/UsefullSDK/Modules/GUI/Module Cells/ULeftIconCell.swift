//
//  ULeftIconCell.swift
//  
//
//  Created by Burak Uzunboy on 26.01.20.
//

import UIKit

/// Base cell for `LeftIconCellModule`.
open class ULeftIconCell: UBaseTableViewCell {
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var titleLabel: UILabel? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var iconView: UIImageView? { return nil }
    
    /// Module which will load and stylize the cell.
    var module: LeftIconCellModule? {
        didSet {
            self.reloadUI()
            self.reloadData()
        }}
    
    open override func reloadUI() {
        super.reloadUI()
        guard let style = self.module?.style else { return }
        
        if self.module?.data.attributedTitle == nil {
            self.titleLabel?.textColor = style.textColor
            self.titleLabel?.font = style.font
            self.titleLabel?.textAlignment = style.alignment
        }
        
        self.iconView?.tintColor = style.iconTintColor
    }
    
    open override func reloadData() {
        super.reloadData()
        guard let data = self.module?.data else { return }
        
        if let attributedText = data.attributedTitle {
            self.titleLabel?.attributedText = attributedText
        } else {
            self.titleLabel?.text = data.title
        }
        
        self.iconView?.image = data.icon
    }
}

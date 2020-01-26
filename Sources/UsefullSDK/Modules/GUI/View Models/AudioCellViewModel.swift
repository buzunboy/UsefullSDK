//
//  AudioCellViewModel.swift
//  
//
//  Created by Burak Uzunboy on 26.01.20.
//

import UIKit

/// Base cell for `AudioCellModule`.
open class AudioCellViewModel: UBaseTableViewCell {
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var titleLabel: UILabel? { return nil }
        
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var audioView: UIView? { return nil }
    
    /// Module which will load and stylize the cell.
    var module: AudioCellModule? {
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
        
    }
    
    open override func reloadData() {
        super.reloadData()
        guard let data = self.module?.data else { return }
        
        if let attributedText = data.attributedTitle {
            self.titleLabel?.attributedText = attributedText
        } else {
            self.titleLabel?.text = data.title
        }
        
//        self.imageView?.image = data.image?.image
    }
}

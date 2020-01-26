//
//  TextCellViewModel.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

/// Base cell for `TextCellModule`.
open class TextCellViewModel: UBaseTableViewCell {
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var textView: UITextView? { return nil }
    
    /// Module which will load and stylize the cell.
    var module: TextCellModule? {
        didSet {
            self.reloadUI()
            self.reloadData()
        }}
    
    open override func reloadUI() {
        super.reloadUI()
        guard let style = self.module?.style else { return }
        
        if self.module?.data.attributedText == nil {
            self.textView?.textColor = style.textColor
            self.textView?.font = style.font
            self.textView?.textAlignment = style.alignment
        }
    }
    
    open override func reloadData() {
        super.reloadData()
        guard let data = self.module?.data else { return }
        
        if let attributedText = data.attributedText {
            self.textView?.attributedText = attributedText
        } else {
            self.textView?.text = data.text
        }
    }
}

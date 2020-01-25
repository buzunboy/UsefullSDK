//
//  UTextCell.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

public class UTextCell: UBaseTableViewCell {
    var textView: UITextView? { return nil }
    
    var module: TextCellModule? {
        didSet {
            self.reloadUI()
            self.reloadData()
        }}
    
    public override func reloadUI() {
        super.reloadUI()
        guard let style = self.module?.style else { return }
        
        self.textView?.textColor = style.textColor
        self.textView?.font = style.font
    }
    
    public override func reloadData() {
        super.reloadData()
        guard let data = self.module?.data else { return }
        
        if let attributedText = data.attributedText {
            self.textView?.attributedText = attributedText
        } else {
            self.textView?.text = data.text
        }
    }
}

//
//  CellStyles.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

/// Base protocol for stylables.
public protocol CellStylable { }

/// Style structure for the `UTextCell`.
public struct TextCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.

    var font: UIFont
    
    /// Alignment that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `textView`.
    ///   - font: Font style that will be applied to text in the `textView`.
    ///   - alignment: Alignment that will be applied to text in the `textView`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .systemFont(ofSize: 14),
                alignment: NSTextAlignment = .left) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

/// Style structure for the `UTitleCell`.
public struct TitleCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.

    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .systemFont(ofSize: 14),
                alignment: NSTextAlignment = .left) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

/// Style structure for the `ULeftIconTextCell`.
public struct LeftIconTextCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `LeftIconTextCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `LeftIconTextCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `LeftIconTextCellModulable`.
    var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    var iconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .systemFont(ofSize: 14),
                iconTintColor: UIColor = .systemLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
    }
    
}

/// Style structure for the `UExpandableTitleCell`.
public struct ExpandableTitleCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    var iconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .systemFont(ofSize: 14),
                iconTintColor: UIColor = .systemLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
    }
}

/// Style structure for the `UAccessoryCell`.
public struct AccessoryCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    var iconTintColor: UIColor
    
    /// Tint color that will be applied in to the `accessoryIconView`.
    var accessoryIconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - accessoryIconTintColor: Tint color that will be applied in to the `accessoryIconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                iconTintColor: UIColor = .systemLink,
                accessoryIconTintColor: UIColor = .systemLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
        self.accessoryIconTintColor = accessoryIconTintColor
    }
}

/// Style structure for the `UImageCell`.
public struct ImageCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
    
}

/// Style structure for the `UVideoCell`.
public struct VideoCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

/// Style structure for the `UAudioCell`.
public struct AudioCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

/// Style structure for the `UGalleryCell`.
public struct GalleryCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `GalleryCellModulable`.
    var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `GalleryCellModulable`.
    var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `GalleryCellModulable`.
    var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .systemLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

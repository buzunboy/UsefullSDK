//
//  CellStyles.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

/// Base protocol for stylables.
public protocol CellStylable { }

/// Style structure for the `TextCellViewModel`.
public struct TextCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.

    public var font: UIFont
    
    /// Alignment that will be applied to text in the `textView`.
    ///
    /// It will not be applied if `attributedText` is set in `TextCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `textView`.
    ///   - font: Font style that will be applied to text in the `textView`.
    ///   - alignment: Alignment that will be applied to text in the `textView`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .systemFont(ofSize: 14),
                alignment: NSTextAlignment = .left) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

/// Style structure for the `TitleCellViewModel`.
public struct TitleCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.

    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TitleCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
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
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `LeftIconTextCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `LeftIconTextCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    public var iconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .systemFont(ofSize: 14),
                iconTintColor: UIColor = .styleLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
    }
    
}

/// Style structure for the `ExpandableTitleCellViewModel`.
public struct ExpandableTitleCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ExpandableTitleCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    public var iconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .systemFont(ofSize: 14),
                iconTintColor: UIColor = .styleLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
    }
}

/// Style structure for the `AccessoryCellViewModel`.
public struct AccessoryCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `TextCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Tint color that will be applied in to the `iconView`.
    public var iconTintColor: UIColor
    
    /// Tint color that will be applied in to the `accessoryIconView`.
    public var accessoryIconTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - iconTintColor: Tint color that will be applied in to the `iconView`.
    ///   - accessoryIconTintColor: Tint color that will be applied in to the `accessoryIconView`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                iconTintColor: UIColor = .styleLink,
                accessoryIconTintColor: UIColor = .styleLink,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.iconTintColor = iconTintColor
        self.alignment = alignment
        self.accessoryIconTintColor = accessoryIconTintColor
    }
}

/// Style structure for the `ImageCellViewModel`.
public struct ImageCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `ImageCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
    
}

/// Style structure for the `VideoCellViewModel`.
public struct VideoCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `VideoCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Tint color that will be applied standard buttons in the cell.
    public var tintColor: UIColor
    
    /// Tint color that will be applied secondary elements, such as loading indicator.
    public var secondaryTintColor: UIColor
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                tintColor: UIColor = .styleLink,
                secondaryTintColor: UIColor = .styleBackground,
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
        self.tintColor = tintColor
        self.secondaryTintColor = secondaryTintColor
    }
}

/// Style structure for the `AudioCellViewModel`.
public struct AudioCellStyle: CellStylable {
    
    /// Text color that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `AudioCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
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
    public var textColor: UIColor
    
    /// Font style that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `GalleryCellModulable`.
    public var font: UIFont
    
    /// Alignment that will be applied to text in the `titleLabel`.
    ///
    /// It will not be applied if `attributedTitle` is set in `GalleryCellModulable`.
    public var alignment: NSTextAlignment
    
    /// Default initializer for the style structure.
    /// - Parameters:
    ///   - textColor: Text color that will be applied to text in the `titleLabel`.
    ///   - font: Font style that will be applied to text in the `titleLabel`.
    ///   - alignment: Alignment that will be applied to text in the `titleLabel`.
    public init(textColor: UIColor = .styleLabel,
                font: UIFont = .boldSystemFont(ofSize: 17),
                alignment: NSTextAlignment = .center) {
        self.textColor = textColor
        self.font = font
        self.alignment = alignment
    }
}

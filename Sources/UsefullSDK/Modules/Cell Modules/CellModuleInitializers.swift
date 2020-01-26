//
//  CellModuleInitializers.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

/// Base protocol for cell module initializers.
public protocol CellModuleInitializable {
    
    /// Returns type of the cell.
    var cellType: UBaseTableViewCell.Type { get }
}

/// Structure that holds all information necessary for cells which are inherited from `UTextCell`.
public struct TextCellModule: CellModuleInitializable {
    
    /// Data model for the cell.
    var data: TextCellData
    
    /// Style model for the cell.
    var style: TextCellStyle
    
    /// Cell type.
    var cell: UTextCell.Type
    
    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: TextCellData,
                style: TextCellStyle,
                cell: UTextCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UTitleCell`.
public struct TitleCellModule: CellModuleInitializable {
    
    /// Data model for the cell.
    var data: TitleCellData
    
    /// Style model for the cell.
    var style: TitleCellStyle
    
    /// Cell type.
    var cell: UTitleCell.Type
    
    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: TitleCellData,
                style: TitleCellStyle,
                cell: UTitleCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `ULeftIconCell`.
public struct LeftIconCellModule: CellModuleInitializable {
    
    /// Data model for the cell.
    var data: LeftIconTextCellData
    
    /// Style model for the cell.
    var style: LeftIconTextCellStyle
    
    /// Cell type.
    var cell: ULeftIconCell.Type
    
    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: LeftIconTextCellData,
                style: LeftIconTextCellStyle,
                cell: ULeftIconCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UExpandableTitleCell`.
public struct ExpandableTitleCellModule: CellModuleInitializable {
    
    /// Data model for the cell.
    var data: ExpandableTitleCellData
    
    /// Style model for the cell.
    var style: ExpandableTitleCellStyle
    
    /// Cell type.
    var cell: UExpandableTitleCell.Type
    
    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: ExpandableTitleCellData,
                style: ExpandableTitleCellStyle,
                cell: UExpandableTitleCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UAccessoryCell`.
public struct AccessoryCellModule: CellModuleInitializable {
    
    /// Data model for the cell.
    var data: AccessoryCellData
    
    /// Style model for the cell.
    var style: AccessoryCellStyle
    
    /// Cell type.
    var cell: UAccessoryCell.Type

    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: AccessoryCellData,
                style: AccessoryCellStyle,
                cell: UAccessoryCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UImageCell`.
public struct ImageCellModule: CellModuleInitializable {

    /// Data model for the cell.
    var data: ImageCellData
    
    /// Style model for the cell.
    var style: ImageCellStyle
    
    /// Cell type.
    var cell: UImageCell.Type

    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: ImageCellData,
                style: ImageCellStyle,
                cell: UImageCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UVideoCell`.
struct VideoCellModule: CellModuleInitializable {

    /// Data model for the cell.
    var data: VideoCellData
    
    /// Style model for the cell.
    var style: VideoCellStyle
    
    /// Cell type.
    var cell: UTextCell.Type

    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: VideoCellData,
                style: VideoCellStyle,
                cell: UTextCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UAudioCell`.
struct AudioCellModule: CellModuleInitializable {

    /// Data model for the cell.
    var data: AudioCellData
    
    /// Style model for the cell.
    var style: AudioCellStyle
    
    /// Cell type.
    var cell: UTextCell.Type

    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: AudioCellData,
                style: AudioCellStyle,
                cell: UTextCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

/// Structure that holds all information necessary for cells which are inherited from `UGalleryCell`.
struct GalleryCellModule: CellModuleInitializable {

    /// Data model for the cell.
    var data: GalleryCellData
    
    /// Style model for the cell.
    var style: GalleryCellStyle
    
    /// Cell type.
    var cell: UTextCell.Type

    public var cellType: UBaseTableViewCell.Type { return self.cell }
    
    /// Initializes module with given properties.
    /// - Parameters:
    ///   - data: Data model for the cell.
    ///   - style: Style model for the cell.
    ///   - cell: Cell type that will be used.
    public init(data: GalleryCellData,
                style: GalleryCellStyle,
                cell: UTextCell.Type) {
        self.data = data
        self.style = style
        self.cell = cell
    }
}

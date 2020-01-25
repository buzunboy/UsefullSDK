//
//  CellStyleProtocols.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

public protocol CellStylable { }

public struct TextCellStylable: CellStylable {
    var textColor: UIColor
    var font: UIFont
    
    public init(textColor: UIColor, font: UIFont) {
        self.textColor = textColor
        self.font = font
    }
}

public struct TitleCellStylable: CellStylable {
    var textColor: UIColor
    var font: UIFont
}

public struct LeftIconTextCellStylable: CellStylable {
    var iconTintColor: UIColor
    var textColor: UIColor
    var font: UIFont
}

public struct ExpandableTitleCellStylable: CellStylable {
    var textColor: UIColor
    var font: UIFont
    var iconTintColor: UIColor
}

public struct AccessoryCellStylable: CellStylable {
    var textColor: UIColor
    var font: UIFont
    var iconTintColor: UIColor
    var accessoryIconTintColor: UIColor
}

public struct ImageCellStylable: CellStylable { }

public struct VideoCellStylable: CellStylable { }

public struct AudioCellStylable: CellStylable { }

public struct GalleryCellStylable: CellStylable { }

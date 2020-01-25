//
//  CellModuleInitializers.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

protocol CellModuleInitializable {
    var cellType: UBaseTableViewCell.Type { get }
}

struct TextCellModule: CellModuleInitializable {    
    var data: TextCellModulable
    var style: TextCellStylable
    var cell: UTextCell.Type
    
    var cellType: UBaseTableViewCell.Type { return self.cell }
}

struct TitleCellModule {
    var data: TitleCellModulable
    var style: TitleCellStylable
}

struct LeftIconCellModule {
    var data: LeftIconTextCellModulable
    var style: LeftIconTextCellStylable
}

struct ExpandableTitleCellModule {
    var data: ExpandableTitleCellModulable
    var style: ExpandableTitleCellStylable
}

struct AccessoryCellModule {
    var data: AccessoryCellModulable
    var style: AccessoryCellStylable
}

struct ImageCellModule {
    var data: ImageCellModulable
    var style: ImageCellStylable
}

struct VideoCellModule {
    var data: VideoCellModulable
    var style: VideoCellStylable
}

struct AudioCellModule {
    var data: AudioCellModulable
    var style: AudioCellStylable
}

struct GalleryCellModule {
    var data: GalleryCellModulable
    var style: GalleryCellStylable
}

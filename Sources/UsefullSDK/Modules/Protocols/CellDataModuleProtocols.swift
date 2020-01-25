//
//  CellDataModuleProtocols.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit

public protocol CellModulable { }

public struct TextCellModulable: CellModulable {
    var text: String?
    var attributedText: NSAttributedString?
    
    public init(text: String) {
        self.text = text
    }
    
    public init(text: NSAttributedString?) {
        self.attributedText = text
    }
}

public struct TitleCellModulable: CellModulable {
    var text: String?
    var attributedText: NSAttributedString?
}

public struct LeftIconTextCellModulable: CellModulable {
    var text: String?
    var icon: UIImage?
    var attributedText: NSAttributedString?
}

public struct ExpandableTitleCellModulable: CellModulable {
    var text: String?
    var icon: UIImage?
    var attributedText: NSAttributedString?
}

public struct AccessoryCellModulable: CellModulable {
    var text: String?
    var icon: UIImage?
    var rightAccessoryIcon: UIImage?
    var attributedText: NSAttributedString?
}

public struct ImageCellModulable: CellModulable {
    var text: String?
    var image: ImageItem?
    var attributedText: NSAttributedString?
}

public struct VideoCellModulable: CellModulable {
    var video: VideoItem
    var text: String?
    var attributedText: NSAttributedString?
    var thumbnailImage: UIImage?
}

public struct AudioCellModulable: CellModulable {
    var audio: AudioItem
    var text: String?
    var attributedText: NSAttributedString?
}

public struct GalleryCellModulable: CellModulable {
    var gallery: [ImageItem]
    var text: String?
    var attributedText: NSAttributedString?
}

public protocol MediaItem {
    
}

public struct ImageItem: MediaItem {
    var image: UIImage?
    var resourceURL: URL?
    
    init(image: UIImage) {
        self.image = image
    }
    
    init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
}

public struct VideoItem: MediaItem {
    var resourceURL: URL
    init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
}

public class AudioItem: MediaItem {
    var resourceURL: URL
    init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
}

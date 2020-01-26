//
//  CellDataModels.swift
//  
//
//  Created by Burak Uzunboy on 25.01.20.
//

import UIKit
import AVKit

/// Base protocol for modulables.
public protocol CellModulable { }

/// Data structure for the `TextCellViewModel`.
public struct TextCellData: CellModulable {
    
    /// Text what will be shown in `textView`.
    ///
    /// if it's not `nil`, `style` property in `TextCellModule` will be used for styling.
    var text: String?
    
    /// Attributed text can be used for shown in `textView`.
    var attributedText: NSAttributedString?
    
    /// Creates data-model with unattributed text string.
    /// - Parameter text: Text what will be shown in `textView`.
    ///
    public init(text: String) {
        self.text = text
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameter text: Attributed text can be used for shown in `textView`.
    public init(text: NSAttributedString?) {
        self.attributedText = text
    }
}

/// Data structure for the `TitleCellViewModel`.
public struct TitleCellData: CellModulable {
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `TitleCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Creates data-model with unattributed text string.
    /// - Parameter title: Text what will be shown in `titleLabel`.
    ///
    public init(title: String) {
        self.title = title
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameter title: Attributed text can be used for shown in `titleLabel`.
    public init(title: NSAttributedString?) {
        self.attributedTitle = title
    }
}

/// Data structure for the `LeftIconCellViewModel`.
public struct LeftIconTextCellData: CellModulable {
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `LeftIconCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Image that will be shown in `iconView`.
    var icon: UIImage?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    public init(title: String? = nil, icon: UIImage?) {
        self.title = title
        self.icon = icon
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    public init(attributedTitle: NSAttributedString, icon: UIImage?) {
        self.attributedTitle = attributedTitle
        self.icon = icon
    }
}

/// Data structure for the `ExpandableTitleCellViewModel`.
public struct ExpandableTitleCellData: CellModulable {
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `ExpandableTitleCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Image that will be shown in `iconView`.
    var icon: UIImage?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    public init(title: String? = nil, icon: UIImage?) {
        self.title = title
        self.icon = icon
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    public init(attributedTitle: NSAttributedString, icon: UIImage?) {
        self.attributedTitle = attributedTitle
        self.icon = icon
    }
}

/// Data structure for the `AccessoryCellViewModel`.
public struct AccessoryCellData: CellModulable {
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `AccessoryCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Image that will be shown in `iconView`.
    var icon: UIImage?
    
    /// Image that will be shown in `rightAccessoryIconView`.
    var rightAccessoryIcon: UIImage?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    ///   - rightAccessory: Image that will be shown in `rightAccessoryIconView`.
    public init(title: String? = nil,
                icon: UIImage?,
                rightAccessory: UIImage?) {
        self.title = title
        self.icon = icon
        self.rightAccessoryIcon = rightAccessory
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - icon: Image that will be shown in `iconView`.
    ///   - rightAccessory: Image that will be shown in `rightAccessoryIconView`.
    public init(attributedTitle: NSAttributedString,
                icon: UIImage?,
                rightAccessory: UIImage?) {
        self.attributedTitle = attributedTitle
        self.icon = icon
    }
}

/// Data structure for the `ImageCellViewModel`.
public struct ImageCellData: CellModulable {
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `ImageCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?

    /// Image will be shown in `imageView`.
    var image: ImageItem?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - image: Image that will be shown in `imageView`.
    public init(title: String? = nil,
                image: ImageItem?) {
        self.title = title
        self.image = image
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - image: Image that will be shown in `imageView`.
    public init(attributedTitle: NSAttributedString,
                image: ImageItem?) {
        self.attributedTitle = attributedTitle
        self.image = image
    }
}

/// Data structure for the `VideoCellViewModel`.
public struct VideoCellData: CellModulable {
    
    /// Video will be shown in `videoView`.
    var video: VideoItem
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `VideoCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Thumbnail image will be shown while video is loading, or paused.
    var thumbnailImage: UIImage?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - video: Video will be shown in `videoView`.
    ///   - thumbnailImage: Thumbnail image will be shown while video is loading, or paused.
    public init(title: String? = nil,
                video: VideoItem,
                thumbnailImage: UIImage?) {
        self.title = title
        self.video = video
        self.thumbnailImage = thumbnailImage
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - video: Video will be shown in `videoView`.
    ///   - thumbnailImage: Thumbnail image will be shown while video is loading, or paused.
    public init(attributedTitle: NSAttributedString,
                video: VideoItem,
                thumbnailImage: UIImage?) {
        self.attributedTitle = attributedTitle
        self.video = video
        self.thumbnailImage = thumbnailImage
    }
}

/// Data structure for the `AudioCellViewModel`.
public struct AudioCellData: CellModulable {
    
    /// Audio will be shown in `audioView`.
    var audio: AudioItem
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `AudioCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - audio: Audio will be shown in `audioView`.
    public init(title: String? = nil,
                audio: AudioItem) {
        self.title = title
        self.audio = audio
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - audio: Audio will be shown in `audioView`.
    ///   - thumbnailImage: Thumbnail image will be shown while video is loading, or paused.
    public init(attributedTitle: NSAttributedString,
                audio: AudioItem) {
        self.attributedTitle = attributedTitle
        self.audio = audio
    }
}

/// Data structure for the `UGalleryCell`.
public struct GalleryCellData: CellModulable {
    
    /// Media items what will be shown in `galleryView`.
    var gallery: [ImageItem]
    
    /// Text what will be shown in `titleLabel`.
    ///
    /// if it's not `nil`, `style` property in `GalleryCellModule` will be used for styling.
    var title: String?
    
    /// Attributed text can be used for shown in `titleLabel`.
    var attributedTitle: NSAttributedString?
    
    /// Creates data-model with unattributed text string.
    /// - Parameters:
    ///   - title: Text what will be shown in `titleLabel`.
    ///   - gallery: Media items what will be shown in `galleryView`.
    public init(title: String? = nil,
                gallery: [ImageItem]) {
        self.title = title
        self.gallery = gallery
    }
    
    /// Creates data-model with attributed text string.
    /// - Parameters:
    ///   - attributedTitle: Attributed text can be used for shown in `titleLabel`.
    ///   - gallery: Media items what will be shown in `galleryView`.
    public init(attributedTitle: NSAttributedString,
                gallery: [ImageItem]) {
        self.attributedTitle = attributedTitle
        self.gallery = gallery
    }
}

/// Base protocol for media items.
public protocol MediaItem {
    
}

/// The structure that keeps necessary properties for image views.
public struct ImageItem: MediaItem {
    
    /// Image that is already loaded into struct.
    var image: UIImage?
    
    /// Remote `URL` that needs to be downloaded from resource.
    var resourceURL: URL?
    
    
    /// Initializes struct with loaded image.
    /// - Parameter image: Loaded image.
    public init(image: UIImage) {
        self.image = image
    }
    
    /// Initializes struct with remote resource URL.
    /// - Parameter resourceURL: Remote `URL` that needs to be downloaded from resource.
    public init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
}

/// The structure that keeps necessary properties for video views.
public struct VideoItem: MediaItem {
    
    /// Remote `URL` that needs to be downloaded from resource.
    var resourceURL: URL
    
    /// Initializes struct with remote resource URL.
    /// - Parameter resourceURL: Remote `URL` that needs to be downloaded from resource.
    public init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
    
    /// Returns `AVPlayer` object.
    var player: AVPlayer {
        let player = AVPlayer(url: self.resourceURL)
        return player
    }
}

/// The structure that keeps necessary properties for audio views.
public struct AudioItem: MediaItem {
    
    /// Remote `URL` that needs to be downloaded from resource.
    var resourceURL: URL
    
    /// Initializes struct with remote resource URL.
    /// - Parameter resourceURL: Remote `URL` that needs to be downloaded from resource.
    public init(resourceURL: URL) {
        self.resourceURL = resourceURL
    }
}

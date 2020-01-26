//
//  AVPlayerView.swift
//  
//
//  Created by Burak Uzunboy on 26.01.20.
//

import UIKit
import AVKit

/**
 Basic AV Player View
 */
public class AVPlayerView: UIView {
    
    /// If `true`, video will try to continue play if pauses by the application
    public var shouldContinueToPlay = false
    
    /// Notifies player changes
    public weak var delegate: AVPlayerViewDelegate?
    
    /// AV Player instance of the media
    weak var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    /// If `true`, video will be paused intentionally
    private var shouldPause: Bool = true
    
    /// Observer for time.
    private var timeObserver: Any?
    
    /// Holds the state for whether notified before or not.
    private var didDelegateNotifiedAboutPlay: Bool = false
    
    /// Returns layer as `AVPlayerLayer`.
    private var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    /// Layer class of the AVPlayer
    override public static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    /// Sets video to Player View
    public func setVideo(player: AVPlayer?) {
        self.player = player
        self.playerLayer.videoGravity = .resizeAspectFill
        self.addObservers()
    }
    
    /**
     Plays video
     */
    public func play() {
        self.shouldPause = false
        self.player?.play()
        
        // set observer to check current time in each 0.5 seconds
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 0.5, preferredTimescale: timeScale)
        self.timeObserver = self.player?.addPeriodicTimeObserver(forInterval: time, queue: .main, using: { [weak self] time in
            if time > .zero, let self = self, let player = self.player {
                
                if player.rate == 0 {
                    // No change in time compared to previous trigger. Means player is paused.
                    self.delegate?.didVideoPause?(player)
                    self.didDelegateNotifiedAboutPlay = false

                    
                } else if !self.didDelegateNotifiedAboutPlay {
                    // first time time is changed. Notify delegate that player started to play.
                    self.delegate?.didVideoStart?(player)
                    self.didDelegateNotifiedAboutPlay = true
                    
                } else if time == player.currentItem?.duration {
                    // end of the media. Notify delegate player is finished to play.
                    self.delegate?.didVideoEnd?(player)
                    self.didDelegateNotifiedAboutPlay = false
                    
                } else {
                    // just notify delegate about time update.
                    self.delegate?.didVideoPlayerTimeUpdated?(player)
                }
                
            }
        })

    }
    
    /**
     Pauses video
     */
    public func pause() {
        self.didDelegateNotifiedAboutPlay = false
        self.shouldPause = true
        self.player?.pause()
    }
    
    /**
     Plays video from the beginning
     */
    public func playFromStart() {
        self.player?.seek(to: CMTime.zero)
        self.play()
    }
    
    /// Adds observers for listening player.
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(didVideoEnd),
                                               name: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(didVideoEnd),
                                               name: .AVPlayerItemPlaybackStalled, object: self.player?.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(didApplicationEnterForeground),
                                               name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    /// Removes itself from the notification center.
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// Called when observer notified about the video end.
    @objc private func didVideoEnd() {
        if let player = self.player {
            self.delegate?.didVideoEnd?(player)
        }
        guard self.shouldContinueToPlay else { return }
    }
    
    /// Called when observer notified about the video stall.
    @objc private func didVideoStall() {
        
    }
    
    /// Called when application enter foreground notification is triggered.
    @objc private func didApplicationEnterForeground() {
        guard self.shouldContinueToPlay else { return }
        self.player?.play()
    }
}

/**
 Custom `AVPlayerView` Delegate Protocol which can notify changings in the Player.
 */
@objc public protocol AVPlayerViewDelegate: class {
    
    /**
     Notifies when player finished to play video.
     - parameter player: `AVPlayer` object which owns that notification.
     */
    @objc optional func didVideoEnd(_ player: AVPlayer)
    
    /**
     Notifies when player is started to play video.
     - parameter player: `AVPlayer` object which owns that notification.
     */
    @objc optional func didVideoStart(_ player: AVPlayer)
    
    /**
     Notifies when video is paused.
     - parameter player: `AVPlayer` object which owns that notification.
     */
    @objc optional func didVideoPause(_ player: AVPlayer)
    
    /**
     Notifies in each time changes on the player.
     - parameter player: `AVPlayer` object which owns that notification.
     */
    @objc optional func didVideoPlayerTimeUpdated(_ player: AVPlayer)
}



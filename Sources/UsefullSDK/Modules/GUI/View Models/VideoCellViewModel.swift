//
//  VideoCellViewModel.swift
//  
//
//  Created by Burak Uzunboy on 26.01.20.
//

import UIKit
import AVKit

/// Base cell for `ImageCellModule`.
open class VideoCellViewModel: UBaseTableViewCell {
    
    // MARK: Properties
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var titleLabel: UILabel? { return nil }
        
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var videoView: AVPlayerView? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var playButton: UIButton? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var loadingIndicator: UIActivityIndicatorView? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var thumbnailImageView: UIImageView? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var fullscreenButton: UIButton? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var muteButton: UIButton? { return nil }
    
    /// The classes inherited should override this property with the one that is demanded to be used.
    open var shouldDetectPinchGesture: Bool = true
    
    /// The raw pointer for the player notifications.
    private var playerItemContext: UnsafeMutableRawPointer?
    
    var actionButtons: [UIView?] {
        return [self.playButton, self.fullscreenButton, self.muteButton]
    }
    
    /// Module which will load and stylize the cell.
    var module: VideoCellModule? {
        didSet {
            self.reloadUI()
            self.reloadData()
        }}
    
    // MARK: - Methods
    
    open override func reloadUI() {
        super.reloadUI()
        guard let style = self.module?.style else { return }
        
        if self.module?.data.attributedTitle == nil {
            self.titleLabel?.textColor = style.textColor
            self.titleLabel?.font = style.font
            self.titleLabel?.textAlignment = style.alignment
        }
        
        self.playButton?.tintColor = style.tintColor
        self.loadingIndicator?.tintColor = style.secondaryTintColor
        self.fullscreenButton?.tintColor = style.tintColor
        self.muteButton?.tintColor = style.tintColor
    }
    
    open override func reloadData() {
        super.reloadData()
        guard let data = self.module?.data else { return }
        
        if let attributedText = data.attributedTitle {
            self.titleLabel?.attributedText = attributedText
        } else {
            self.titleLabel?.text = data.title
        }
        
        self.thumbnailImageView?.image = data.thumbnailImage
    }
    
    /// Remove observers before deinitialization.
    deinit {
        self.removeObservers()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onViewTouch(_:)))
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(onPinchOccurred(_:)))
        self.addGestureRecognizer(tapGesture)
        self.addGestureRecognizer(pinchGesture)
    }
    
    /// Removes notification observers of the cell.
    func removeObservers() {
        self.videoView?.player?.removeObserver(self, forKeyPath: "rate")
        NotificationCenter.default.removeObserver(self)
        self.playerItemContext = nil
    }
    
    /// Pauses the player.
    @objc func pausePlayer() {
        self.module?.data.video.player.pause()
    }
    
    /// Observers the player item context and notifies delegate about changes.
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerItemContext else {
            super.observeValue(forKeyPath: keyPath,
                               of: object,
                               change: change,
                               context: context)
            return
        }
        
        guard let player = self.videoView?.player else { return }
        
        if player.rate == 0 {
            self.didVideoPause(player)
        }
    }
    
    /// Called when fullscreen button is touched,
    @objc func onFullscreenBtnTouch(_ sender: Any?) {
        guard let player = self.videoView?.player, let topVC = UIApplication.topViewController() else { return }
        let playerController = FullscreenVideoPlayerController()
        playerController.dismissCompletion = { [weak self](animated) in
            // when dismissed return player to back
            self?.videoView?.play()
        }
        playerController.player = player
        topVC.present(playerController, animated: true) {
            self.shouldDetectPinchGesture = true
        }
    }
    
    /// Called when mute button is touched.
    @objc func onMuteBtnTouch(_ sender: UIButton) {
        guard let player = self.videoView?.player else { return }
        if player.isMuted {
            player.isMuted = false
//            self.muteBtn.setImage(DefaultStyle.videoUnmuteIcon, for: .normal)
        } else {
            player.isMuted = true
//            self.muteBtn.setImage(DefaultStyle.videoMuteIcon, for: .normal)
        }
    }
    
    /// Called when user is touched to the view.
    @objc func onViewTouch(_ sender: UIGestureRecognizer) {
        let isHidden = self.playButton?.isHidden ?? true
        self.changeVisibilityOfActions(isHidden)
    }
    
    /// Changes opacity/hidden properties of the action buttons.
    func changeVisibilityOfActions(_ hide: Bool) {
        if !(self.videoView?.player?.isPlaying ?? false) && hide {
            return
        }

        if hide {
            let btns = self.actionButtons
            UIView.animate(withDuration: 0.3, animations: {
                btns.forEach { (view) in
                    view?.alpha = 0.0
                }
            }) { (completed) in
                btns.forEach { (view) in
                    view?.isHidden = true
                }
            }
        } else {
            let btns = self.actionButtons
            btns.forEach { (view) in
                view?.isHidden = false
            }
            UIView.animate(withDuration: 0.3) {
                btns.forEach { (view) in
                    view?.alpha = 1.0
                }
            }
        }
    }
    
    /// Called when pinch gesture is detected.
    @objc func onPinchOccurred(_ gesture: UIGestureRecognizer) {
        if self.shouldDetectPinchGesture {
            self.shouldDetectPinchGesture = false
            self.onFullscreenBtnTouch(self.fullscreenButton)
        }
    }
    
    /// Property to trace state of the video.
    private var isVideoStarted = false
    
    // MARK: - AV Video View Delegate
    func didVideoStart(_ player: AVPlayer) {
        self.playButton?.isSelected = true
        self.isVideoStarted = true
        self.videoView?.shouldContinueToPlay = true

        self.loadingIndicator?.stopAnimating()
        let thumbnail = self.thumbnailImageView
        UIView.animate(withDuration: 0.2, animations: {
            thumbnail?.alpha = 0.0
        }) { (completed) in
            thumbnail?.isHidden = true
        }

        // hide actions bar after a time when video started to play
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            self.changeVisibilityOfActions(true)
        }
    }
    
    func didVideoEnd(_ player: AVPlayer) {
        self.videoView?.player?.seek(to: .zero)
        self.videoView?.pause()
        self.isVideoStarted = false
    }
    
    func didVideoPause(_ player: AVPlayer) {
        self.playButton?.isSelected = false
        self.videoView?.shouldContinueToPlay = false
        self.isVideoStarted = false

        self.loadingIndicator?.stopAnimating()
        let thumbnail = self.thumbnailImageView
        thumbnail?.isHidden = false
        UIView.animate(withDuration: 0.2, animations: {
            thumbnail?.alpha = 1.0
        })

        // show actions bar
        self.changeVisibilityOfActions(false)
    }
    
}

// MARK: - Full Screen AVPlayer Controller

/// Custom ViewController inherited from `AVPlayerViewController` for full-screen video playing capability.
public class FullscreenVideoPlayerController: AVPlayerViewController {
    
    /// Attach listener to get notified when view controller is dismissed.
    public var dismissCompletion: ((_ animated: Bool)->())?
    
    /// Default initializer.
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    /// Required initializer.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Notifies listener.
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.dismissCompletion?(animated)
    }
    
    /// Notifies listener.
    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag) { [weak self] in
            self?.dismissCompletion?(flag)
            completion?()
        }
    }
}

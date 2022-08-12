//
//  VideoEditorVideoController+SpeedRate.swift
//  HXPHPicker
//
//  Created by JOJO on 2022/8/12.
//

import Foundation

// MARK: VideoEditorSpeedRateViewDelegate
extension VideoEditorViewController: VideoEditorSpeedRateViewDelegate {
    func speedRateView(_ speedRateView: VideoEditorSpeedRateView, didChangedSpeedRate rate: Float) {
        PhotoManager.shared.videoSpeedRate = rate
        // MARK: videoSpeedRate
        videoView.playerView.player.rate = PhotoManager.shared.videoSpeedRate
        debugPrint("videoView.playerView.player.rate = \(videoView.playerView.player.rate)")
        debugPrint("videoView.playerView.player = \(videoView.playerView.player)")
    }
    
}

//
//  LoginVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 2/17/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
import FacebookLogin
import AVFoundation

class LoginVC: UIViewController {
    
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Background Video (make sure always under 5mb)
        let videoURL: NSURL = Bundle.main.url(forResource: "bg", withExtension: "mp4")! as NSURL
        player = AVPlayer(url: videoURL as URL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        playerLayer.frame = view.frame
        view.layer.addSublayer(playerLayer)
        player?.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil, using: { (_) in
            DispatchQueue.main.async {
                self.player?.seek(to: kCMTimeZero)
                self.player?.play()
            }
        })

        //Facebook Login
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        loginButton.frame = CGRect(x :0, y: 610, width: view.frame.width - 0, height: 60)
        
        view.addSubview(loginButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

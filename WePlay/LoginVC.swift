//
//  LoginVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 2/17/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
import AVFoundation
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import FirebaseAuth

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Facebook Login
    @IBAction func facebookLogin(sender: UIButton) {
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            if let error = error {
                print("Failed to login: \(error.localizedDescription)")
                return
            }
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FIRFacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            // Perform login by calling Firebase APIs
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if let error = error {
                    print("Login error: \(error.localizedDescription)")
                    let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(okayAction)
                    self.present(alertController, animated: true, completion: nil)
                    
                    return
                }
                
                // Present the main view
                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LandingPg") {
                    UIApplication.shared.keyWindow?.rootViewController = viewController
                    
                    let transition = CATransition()
                    transition.duration = 1.0
                    transition.type = kCATransitionMoveIn
                    transition.subtype = kCATransitionFromTop
                    
                    self.view.layer.add(transition, forKey: kCATransition)
                    self.dismiss(animated: false, completion: nil)
                }
                
            })
            
        }   
    }
    
}






//
//  LandingPgVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 2/26/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
import FirebaseAuth

class LandingPgVC: UIViewController, RadialMenuDelegate {

    var radialMenu:RadialMenu!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.layer.cornerRadius = self.button.frame.size.width / 2;
        self.button.clipsToBounds = true;
        self.radialMenu = RadialMenu()
        self.radialMenu.delegate = self
        self.button.setBackgroundImage(self.radialMenu.getProfilePic(), for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // Logout function
    @IBAction func logout(_ sender: AnyObject) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Login") {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        self.radialMenu.buttonsWillAnimateFromButton(sender as! UIButton, frame: self.button.frame, view: self.view)
    }
    
    func numberOfItemsInRadialMenu (_ radialMenu:RadialMenu)->NSInteger {
        return 4
    }
    
    func arcSizeInRadialMenu (_ radialMenu:RadialMenu)->NSInteger {
        return 360
    }
    
    func arcRadiousForRadialMenu (_ radialMenu:RadialMenu)->NSInteger {
        return 120
    }
    
    func radialMenubuttonForIndex(_ radialMenu:RadialMenu,index:NSInteger)->RadialButton {
        
        let button:RadialButton = RadialButton()
        
        self.button.layer.cornerRadius = self.button.frame.size.width / 2;
        self.button.clipsToBounds = true;

        if index == 1 {
            button.setImage(UIImage(named: "nearMe"), for:UIControlState())
        } else if index == 2 {
            button.setImage(UIImage(named: "pastEvents"), for:UIControlState())
        } else if index == 3 {
            button.setImage(UIImage(named: "futureEvents"), for:UIControlState())
        }
        if index == 4 {
            button.setImage(UIImage(named: "currentEvent"), for:UIControlState())
        } 
        
        return button
    }
    
    func radialMenudidSelectItemAtIndex(_ radialMenu:RadialMenu,index:NSInteger) {
        
        /************ SEGUES NEED TO BE UPDATED AS MORE VCs ARE ADDED **************/
        
        if index == 1 {
            performSegue(withIdentifier: "toMap", sender: self)
        } else if index == 2 {
            performSegue(withIdentifier: "toChannels", sender: self)
        } else if index == 3 {
           performSegue(withIdentifier: "toChannels", sender: self)
        }
        if index == 4 {
            performSegue(withIdentifier: "toChannels", sender: self)
        }
    }
}

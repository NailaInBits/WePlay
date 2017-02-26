//
//  LandingPageVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 2/24/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit

class LandingPageVC: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2;
        self.profileImageView.clipsToBounds = true;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

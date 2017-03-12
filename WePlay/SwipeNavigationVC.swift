//
//  SwipeNavigationVC.swift
//  WePlay
//
//  Created by Nishat Anjum on 3/7/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit

/*class SwipeNavigationVC: UIViewController {
    
    @IBOutlet var UIScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //Left VC
        let Channels = storyboard?.instantiateViewController(withIdentifier: "channels") as! ChannelListVC
        self.addChildViewController(Channels)
        self.UIScrollView.addSubview(Channels.view)
        Channels.didMove(toParentViewController: self)
        
        //Middle VC
        let Home = storyboard?.instantiateViewController(withIdentifier: "LandingPg") as! LandingPgVC
        var frame1 = Home.view.frame
        frame1.origin.x = self.view.frame.size.width
        Home.view.frame = frame1
        self.addChildViewController(Home)
        self.UIScrollView.addSubview(Home.view)
        Home.didMove(toParentViewController: self)
        
        //Right VC
        let Magic = storyboard?.instantiateViewController(withIdentifier: "magic") as! UINavigationController
        let frame2 = Magic.view.frame
        frame1.origin.x = self.view.frame.size.width
        Magic.view.frame = frame2
        self.addChildViewController(Magic)
        self.UIScrollView.addSubview(Magic.view)
        Magic.didMove(toParentViewController: self)
        
        
        var scrollWidth: CGFloat = 3 * self.view.frame.width
        let scrollHeight: CGFloat = 0
        
        self.UIScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        self.UIScrollView! .setContentOffset(CGPoint(x: self.view.frame.width, y: scrollHeight), animated: false)
        
        // hide the scroll bar.
        UIScrollView?.showsHorizontalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
} */

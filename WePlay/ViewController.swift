//
//  ViewController.swift
//  WePlay
//
//  Created by Vincent Liu on 3/14/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var channelRef: FIRDatabaseReference = FIRDatabase.database().reference().child("pastEvents")
    
    @IBOutlet weak var EventText: UITextField!
    
    
    @IBAction func createChannel(_: UIButton) {
        if let name = EventText?.text {
            let newChannelRef = channelRef.childByAutoId()
            let channelItem = [
                "name": name
            ]
            newChannelRef.setValue(channelItem)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

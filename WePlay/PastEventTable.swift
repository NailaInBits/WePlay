//
//  PastEventTable.swift
//  WePlay
//
//  Created by Vincent Liu on 3/14/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit
import Firebase

class PastEventTable: UITableViewController {
    
    private var events: [PastEvent] = []
    private var ref: FIRDatabaseReference =
                FIRDatabase.database().reference().child("pastEvents")
    private var gsRef: FIRStorageReference = FIRStorage.storage().reference(forURL: <#T##String#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.retriveEvents()
        title = "Past Events"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        //let image = self.urlToImage(url: events[(indexPath as NSIndexPath).row].photoUrl)
        
        // Configure the cell...
        cell.textLabel?.text = events[(indexPath as NSIndexPath).row].name
        //cell.imageView?.

        return cell
    }
    
    private func retriveEvents() {
        ref.observe(.childAdded, with: { (snapshot) -> Void in
            let eventData = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            if let name = eventData["name"] as! String!, name.characters.count > 0 {
                self.events.append(PastEvent(id: id, name: eventData["name"] as! String,  photoUrl: eventData["photoUrl"] as! String))
                self.tableView.reloadData()
            } else {
                print("Error! Could not decode event data")
            }
        })
    }
    
    /*private func urlToImage(url: String!) -> UIImage? {
        let ref = gsRef.storage.reference(forURL: url)
        let imageRef = ref.data(withMaxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("An error has occurred: \(error)")
            } else {
                let image = UIImage(data: data!)
            }
        }
        return image
    }*/

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

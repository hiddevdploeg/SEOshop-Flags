//
//  ViewController.swift
//  SEOshop Flags
//
//  Created by Hidde van der Ploeg on 21/09/15.
//  Copyright © 2015 Hidde van der Ploeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func testWeb(sender: AnyObject) {
        
        
            let vc = WebViewController()
            vc.modalPresentationStyle = .Custom
            self.presentViewController(vc, animated: true, completion: nil)
            

    }
    
    let red = UIColor(red:0.73, green:0.20, blue:0.21, alpha:1.0)
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lato-Semibold", size: 18)!]

        
    }
    
    // MARK: Table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("flagCell", forIndexPath: indexPath) as! FlagTableViewCell
        let row = indexPath.row
        cell.countryImage.image = UIImage(named: data[row]["Code"]!)
        cell.countryName.text = data[row]["Name"]!
        cell.countryCode.text = data[row]["Code"]!
        
        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let selectedIndex = self.tableView.indexPathForCell(sender as! FlagTableViewCell)
        
        if (segue.identifier == "showFlag") {
            let vc = segue.destinationViewController as! WebViewController
            vc.country = data[(selectedIndex?.row)!]["Name"]!
           
        }
        
    }
    
    
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        if (segue.identifier == "showWeb") {
//            let text = textField.text as String!
//            let vc = segue.destinationViewController as! WebViewController
//            vc.country = data[row]["Name"]
//        }
//        
//    }
//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//    }

}


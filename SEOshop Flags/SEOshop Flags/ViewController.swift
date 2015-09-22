//
//  ViewController.swift
//  SEOshop Flags
//
//  Created by Hidde van der Ploeg on 21/09/15.
//  Copyright © 2015 Hidde van der Ploeg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let red = UIColor(red:0.73, green:0.20, blue:0.21, alpha:1.0)
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
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
        
        if cell.countryImage.image?.hashValue == nil {
            cell.countryName.textColor = red
        }
        
        return cell
    }


}


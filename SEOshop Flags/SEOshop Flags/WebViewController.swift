//
//  WebViewController.swift
//  SEOshop Flags
//
//  Created by Hidde van der Ploeg on 23/09/15.
//  Copyright © 2015 Hidde van der Ploeg. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    let url = NSURL(string: "https://www.google.nl/search?as_st=y&tbm=isch&as_q=afghanistan+flag")
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

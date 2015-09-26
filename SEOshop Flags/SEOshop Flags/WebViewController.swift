//
//  WebViewController.swift
//  SEOshop Flags
//
//  Created by Hidde van der Ploeg on 23/09/15.
//  Copyright © 2015 Hidde van der Ploeg. All rights reserved.
//

import UIKit

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "+")
    }
}

class WebViewController: UIViewController {

    
    var country = data[0]["Name"]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        let mainFrame = UIView()
        mainFrame.frame = CGRect(x: 0, y: 32, width: 304, height: 496)
        mainFrame.center.x = view.center.x
        mainFrame.center.y = view.center.y
        mainFrame.backgroundColor = UIColor.whiteColor()
        mainFrame.layer.cornerRadius = 6
        
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 12, width: 304, height: 20)
        title.textAlignment = .Center
        title.text = "Flag of \(country)"
        title.font = UIFont(name: "Lato-Regular", size: 16)
        
        
        let website = UIWebView()
        website.frame = CGRect(x: 0, y: 44, width: 304, height: 400)
        let trimmedString = country.removeWhitespace()
        trimmedString.replace("Å", replacement: "A")
        let url = "https://www.google.nl/search?as_st=y&tbm=isch&hl=nl&as_q=\(trimmedString)+flag&as_epq=&as_oq=&as_eq=&tbs=isz:m"
        website.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
       
        let dismissButton = UIButton()
        dismissButton.frame = CGRect(x: 0, y: 446, width: 304, height: 44)
        dismissButton.setTitle("Got it, Thanks!", forState: .Normal)
        dismissButton.setTitleColor(UIColor(red:0.16, green:0.46, blue:0.78, alpha:1.0), forState: .Normal)
        dismissButton.addTarget(self, action: "dismiss:", forControlEvents: .TouchUpInside)
        dismissButton.titleLabel!.font = UIFont(name: "Lato-Semibold", size: 16)
        
        mainFrame.addSubview(dismissButton)
        mainFrame.addSubview(title)
        mainFrame.addSubview(website)
        self.view.addSubview(mainFrame)
        
        
    }
    func dismiss(sender: UIButton!) {
    self.dismissViewControllerAnimated(true, completion: nil)
    }
}

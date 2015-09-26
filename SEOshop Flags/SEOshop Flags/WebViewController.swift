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
}

let screenSize: CGRect = UIScreen.mainScreen().bounds

class WebViewController: UIViewController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    var country = data[0]["Name"]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.0)
        
        UIView.animateWithDuration(0.5) { 
            self.view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        }
        
        let mainFrame = UIView()
        mainFrame.frame = CGRect(x: 16, y: 20, width: screenSize.width-32, height: screenSize.height-40)
        mainFrame.backgroundColor = UIColor.whiteColor()
        mainFrame.layer.cornerRadius = 6
        mainFrame.layer.shadowColor = UIColor.blackColor().CGColor
        mainFrame.layer.shadowOpacity = 0.5
        mainFrame.layer.shadowRadius = 8
        mainFrame.layer.shadowOffset = CGSizeMake(0, 1)
        
        
        let title = UILabel()
        title.frame = CGRect(x: 12, y: 12, width: mainFrame.frame.width-24, height: 20)
        title.textAlignment = .Center
        title.text = "Flag of \(country)"
        title.font = UIFont(name: "Lato-Regular", size: 16)
        
        
        let website = UIWebView()
        website.frame = CGRect(x: 0, y: 44, width: mainFrame.frame.width, height: mainFrame.frame.height-96)
        let trimmedString = country.replace(" ", replacement: "+")
        trimmedString.replace("Å", replacement: "A")
        let url = "https://www.google.nl/search?as_st=y&tbm=isch&hl=nl&as_q=\(trimmedString)+flag&as_epq=&as_oq=&as_eq=&tbs=isz:m"
        website.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
       
        let dismissButton = UIButton()
        dismissButton.frame = CGRect(x: 0, y: mainFrame.frame.height-50, width: mainFrame.frame.width, height: 44)
        dismissButton.setTitle("Got it, Thanks!", forState: .Normal)
        dismissButton.setTitleColor(UIColor(red:0.16, green:0.46, blue:0.78, alpha:1.0), forState: .Normal)
        dismissButton.setTitleColor(UIColor(red:0.16, green:0.46, blue:0.78, alpha:0.5), forState: .Highlighted)
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

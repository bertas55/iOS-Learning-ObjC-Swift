//
//  ViewController.swift
//  NSURLSession_WebView
//
//  Created by Hubert on 08.05.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!

    func displayURL() {
        let myURL = NSURL(string: "http://google.com")

        myWebView.loadRequest(NSURLRequest(URL: myURL!))

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        displayURL()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


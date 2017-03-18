//
//  ViewController.swift
//  GKLoader
//
//  Created by Jonathan Unsworth on 2017/03/16.
//  Copyright © 2017 Global Kinetic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loader: GKLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //loader = GKLoader.init(title: "Title Title", description: "Title Description", image: UIImage(named: "Bidvest/ic_loader")!)
        
        GKLoaderController.sharedInstance.setDisplay(title: "Title Header", description: "This will only take a moment.", image: UIImage(named: "Bidvest/ic_loader")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showProgress () {
        GKLoaderController.sharedInstance.show()
    }
    
    @IBAction func hideProgress() {
        GKLoaderController.sharedInstance.hide()
    }


}


//
//  ViewController.swift
//  TuneShare
//
//  Created by Aman Dhruva Thamminana on 11/30/20.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController {
    
    @IBOutlet var googleSignInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }


}


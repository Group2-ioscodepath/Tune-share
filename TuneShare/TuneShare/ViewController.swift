//
//  ViewController.swift
//  TuneShare
//
//  Created by Aman Dhruva Thamminana on 11/30/20.
//

import UIKit
import Parse
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet var googleSignInButton: GIDSignInButton!
    
    @IBOutlet weak var signInButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        signInButton.backgroundColor = UIColor.init(red: 48/255, green: 175/255, blue: 99/255, alpha: 1)
        signInButton.layer.cornerRadius = 25.0
        signInButton.tintColor = UIColor.white
        
        googleSignInButton.layer.cornerRadius = 20.0
    }


}


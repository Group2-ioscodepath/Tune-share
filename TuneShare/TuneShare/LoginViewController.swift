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
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        signInButton.backgroundColor = UIColor.init(red: 48/255, green: 175/255, blue: 99/255, alpha: 1)
        signInButton.layer.cornerRadius = 25.0
        signInButton.tintColor = UIColor.white
        
        googleSignInButton.layer.cornerRadius = 20.0
        
        signUpButton.backgroundColor = UIColor.init(red: 48/255, green: 175/255, blue: 99/255, alpha: 1)
        signUpButton.layer.cornerRadius = 20.0
        signUpButton.tintColor = UIColor.white
    }
    
    @IBAction func signInButton(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("haha sucks to suck there is an error \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{(sucess, error) in
            if sucess {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                print("haha sucks to suck there is an error \(error?.localizedDescription)")
            }
        }
    }
    

}


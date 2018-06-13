//
//  SigninControllerViewController.swift
//  Pod
//
//  Created by Berkay Ersengun on 12/06/2018.
//  Copyright © 2018 Berkay Ersengun. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit

class SigninControllerViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    
  
    @IBOutlet weak var buttonGoogle: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonEmail: UIButton!
    
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
  
    @IBAction func facebookButtonAction(_ sender: Any) {
        loginFacebook()
        
    }
    
    func loginFacebook(){
        let login = FBSDKLoginManager()
        
        login.logIn(withReadPermissions: ["public_profile","email"], from: nil) { (result, error) in
            if result != nil {
              print("error")
            }
            
        }
        
        
    }
    
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
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


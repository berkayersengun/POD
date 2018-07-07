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
import FirebaseAuth

class SigninControllerViewController: UIViewController, FBSDKLoginButtonDelegate {
 
    @IBOutlet weak var buttonGoogle: UIButton!
    @IBOutlet weak var buttonFacebook: UIButton!
    @IBOutlet weak var buttonEmail: UIButton!
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
   
    
    @IBAction func googleButtonAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
  
    @IBAction func facebookButtonAction(_ sender: Any) {
        loginFacebook()
        
    }
    
    func loginFacebook(){
        let login = FBSDKLoginManager()
        
        login.logIn(withReadPermissions: ["public_profile"], from: self) { (result, error) in
            
            if (error != nil || (result?.isCancelled)!){
            print(error)
            print("Could not logged in to Facebook.")
                
            }else {
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)

                Auth.auth().signInAndRetrieveData(with: credential, completion: { (result, error) in
                    if (error != nil){
                    print("Error, Facebook authentification is not completed.")
                    print(error)
                        
                    }else{
                        result?.user.getIDToken(completion: { (token, error) in
                            if (error != nil){
                                print(error)
                            }else {
                                print("Idtoken for Facebook: ", token!)
                            }
                            
                        })
                    }
                    
                })
                
            }
        }
        
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEmail.layer.cornerRadius = 16
        buttonGoogle.layer.cornerRadius = 16
        buttonFacebook.layer.cornerRadius = 16
//        self.performSegue(withIdentifier: "signIn", sender: nil)
       
        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let emailController = segue.destination as! EmailViewController

//    }
    
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


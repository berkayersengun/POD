//
//  EmailViewController.swift
//  Pod
//
//  Created by Berkay Ersengun on 24/06/2018.
//  Copyright © 2018 Berkay Ersengun. All rights reserved.
//

import UIKit
import FirebaseAuth

class EmailViewController: UIViewController {

    @IBOutlet weak var buttonSignIn: UIButton!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldPass: UITextField!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
            buttonSignIn.layer.cornerRadius = 16
            buttonSignUp.layer.cornerRadius = 16
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: Any) {
        
        if let email = self.textfieldEmail.text,
            let pass = self.textfieldPass.text {
            
            Auth.auth().signIn(withEmail: email, password: pass, completion: { (result, error) in
                if (error != nil){
                    print("Couldn't sign in, try again.\n",error)
                }else {
                    print("User signed in.")
                    result?.user.getIDToken(completion: { (token, error) in
                        if (error != nil){
                            print(error)
                        }else{
                            //print(token)
                        
                        }
                    })
                    
                }
            })
        }
        else {
            print("Email or password cannot be blank.")
            return
        }
        
        
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

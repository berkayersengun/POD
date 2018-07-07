//
//  SignUpViewController.swift
//  Pod
//
//  Created by Berkay Ersengun on 24/06/2018.
//  Copyright © 2018 Berkay Ersengun. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var buttonSubmit: UIButton!
    
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var textfieldSurname: UITextField!
    @IBOutlet weak var textfieldEmail: UITextField!
    @IBOutlet weak var textfieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSubmit.layer.cornerRadius = 16
        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender: Any) {
      
        if  let email = self.textfieldEmail.text,
            let pass = self.textfieldPassword.text {
            
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (result, error) in
                if (error != nil){
                   
                    print("Try again.")
                    print(error)
                }else {
                    
                    self.performSegue(withIdentifier: "backToSignIn", sender: nil)
                     print("User created.")
            
                }
            })
       
            
            
        }
            else {
        
                print("Email or password cannot be blank.")
            
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

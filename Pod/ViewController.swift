//
//  ViewController.swift
//  Pod
//
//  Created by Berkay Ersengun on 12/06/2018.
//  Copyright © 2018 Berkay Ersengun. All rights reserved.
//

import UIKit
import GoogleSignIn


class ViewController: UIViewController ,GIDSignInUIDelegate   {
    
      
    @IBOutlet weak var buttonSignup: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        buttonSignup.layer.cornerRadius = 16
        buttonLogin.layer.cornerRadius = 16
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


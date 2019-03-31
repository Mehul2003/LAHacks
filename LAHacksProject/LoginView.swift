//
//  ViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/29/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class LoginView: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil
        {
            performSegue(withIdentifier: "ltm", sender: self)
        }
        print(Auth.auth().currentUser?.uid)
        
    }

    
    @IBAction func signUpAction(_ sender: UIButton) { //login action
        if emailText.text != nil && passText.text != nil
        {
            Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!, completion: nil)
            performSegue(withIdentifier: "ltm", sender: self)
        }
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
}


//
//  LogInViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class SignUpView: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signUp(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: email.text!, password: pass.text!, completion: nil)
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { (user, err) in
            if err != nil
            {
                print(err!)
            }
        }
        let ref = Database.database().reference()
        let uref = ref.child("users")
        let values = ["first name" : fName.text!, "last name" : lName.text!, "email" : email.text!, "password" : pass.text!]
        uref.child((Auth.auth().currentUser?.uid)!).setValue(values)
        performSegue(withIdentifier: "stm", sender: self)
    }
    

}

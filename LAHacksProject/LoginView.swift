//
//  ViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/29/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginView: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil
        {
            print("logged in")
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        }
        if (Auth.auth().currentUser == nil)
        {
            print("logged out")
        }
        
    }

    
    @IBAction func signUpAction(_ sender: UIButton) { //login action
        if emailText.text != nil && passText.text != nil
        {
            SVProgressHUD.show()
            Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!, completion: { (user, err) in
                if err != nil
                {
                    print(err!)
                    SVProgressHUD.dismiss()
                }
                else
                {
                    SVProgressHUD.dismiss()
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! MainViewController
                    self.present(nextViewController, animated:true, completion:nil)
                }
            })
        }
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
    
}


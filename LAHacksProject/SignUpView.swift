//
//  LogInViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

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
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: email.text!, password: pass.text!) { (user, err) in
            if err != nil
            {
                print(err!)
                SVProgressHUD.dismiss()
            }
            else
            {
                SVProgressHUD.dismiss()
                print("success1")
                print(Auth.auth().currentUser != nil)
                let ref = Database.database().reference()
                let uref = ref.child("users")
                let values = ["first name" : self.fName.text!, "last name" : self.lName.text!, "email" : self.email.text!, "password" : self.pass.text!, "score" : "0.0", "img" : ""]
                uref.child((user?.uid)!).setValue(values)
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Question") as! QuestionsViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
}

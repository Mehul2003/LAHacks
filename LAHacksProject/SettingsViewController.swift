//
//  SettingsViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        do {
        try Auth.auth().signOut()
        } catch let signOutError as NSError {
        print ("Error signing out: %@", signOutError)
        }
    }
}

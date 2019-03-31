//
//  ChatViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/31/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func startChat(_ sender: UIButton) {
        performSegue(withIdentifier: "chat", sender: self)
    }
    
}

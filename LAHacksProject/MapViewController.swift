//
//  MapViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/31/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: UIButton) {
        performSegue(withIdentifier: "toMain", sender: self)
    }
}

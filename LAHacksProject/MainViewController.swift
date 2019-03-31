//
//  MainViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        print(Auth.auth().currentUser?.email)
        print(Auth.auth().currentUser?.uid)
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let fname = value?["first name"] as? String ?? ""
            let lname = value?["last name"] as? String ?? ""
            let score = value?["score"] as? String ?? ""
            self.scoreLabel.text = score
            self.nameLabel.text = "\(fname) \(lname)"
        }) { (error) in
            print(error.localizedDescription)
        }
        
        Database.database().reference().child("users").child(userID!).observe(.childChanged) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let score = value?["score"] as? String ?? ""
            self.scoreLabel.text = score
        }
    }
    @IBAction func changeImage(_ sender: UIButton) {
        let p = UIImagePickerController()
        p.delegate = self
        p.allowsEditing = true
        present(p, animated: true, completion: nil)

    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img =  info["UIImagePickerControllerEditedImage"] as? UIImage
        image.image = img
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func goToSettings(_ sender: UIButton) {
        performSegue(withIdentifier: "mts", sender: self)
    }
    @IBAction func goToPeople(_ sender: UIButton) {
        performSegue(withIdentifier: "mtp", sender: self)
    }
    @IBAction func goToChat(_ sender: UIButton) {
        performSegue(withIdentifier: "mtc", sender: self)
    }
}

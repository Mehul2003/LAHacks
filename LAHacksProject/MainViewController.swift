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
    var fname: String = ""
    var lname: String = ""
    var email: String = ""
    var score: String = ""
    var pass: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let userID = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.fname = value?["first name"] as? String ?? ""
            self.lname = value?["last name"] as? String ?? ""
            self.score = value?["score"] as? String ?? ""
            self.score = value?["score"] as? String ?? ""
            self.pass = value?["password"] as? String ?? ""
            //let imageURL = value?["img"] as? String ?? ""
            self.nameLabel.text = "\(self.fname) \(self.lname)"
            self.scoreLabel.text = self.score
//            if let profileURL = imageURL {
//                let url = NSURL(string: profileURL)
//                URLSession.sharedSession().dataTaskWithURL(url!)
//                URLSession.session
//            }
            //self.image.image
            //print(snapshot)
        }) { (error) in
            print(error.localizedDescription)
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
        let imgName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child("\(imgName).png")
        if let uploadData = UIImagePNGRepresentation(image.image!) {
            storageRef.putData(uploadData, metadata: nil, completion: { (meta, err) in
                if err != nil {
                    print(err!)
                }
                if let imgURL = meta?.downloadURL()?.absoluteString
                {
                    let values = ["first name" : self.fname, "last name" : self.lname, "email" : self.email, "password" : self.pass, "score" : self.score, "img" : imgURL]
                    Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).setValue(values)
                }
            })
        }
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

//
//  QuestionsViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    @IBOutlet weak var line: UIImageView!
    @IBOutlet weak var qNum: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    var cq = 0;
    var score = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions.text = "Here we will ask you a series of questions to determine your Ecological Footprint"
        option1.isHidden = true
        option2.isHidden = true
        option3.isHidden = true
        option4.isHidden = true
        nextButton.setTitle("Start Quiz", for: .normal)
        line.isHidden = true
        
    }

    @IBAction func option1Pressed(_ sender: UIButton) {
        if cq == 1
        {
            score += 0.92
        }
        else if cq == 2
        {
            score += 0
        }
        else if cq == 3
        {
            score += 0
        }
        else if cq == 4
        {
           score += 1.85
        }
        else if cq == 5
        {
            score += 0
        }
        else if cq == 6
        {
            score += 0.56
        }
        else if cq == 7
        {
            score += 0
        }
        else if cq == 8
        {
            score -= 0.27
        }
        else if cq == 9
        {
            score += 0.18
        }
        else if cq == 10
        {
            score += 0
        }
        cq+=1
        if cq == 1
        {
            questions.text = "How long do you spend in the shower?"
            option1.setTitle("<10", for: .normal)
            option2.setTitle("10-30", for: .normal)
            option3.setTitle(">30", for: .normal)
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
        }
        else if cq == 2
        {
            questions.text = "When brushing your teeth, do you turn off the tap?"
            option1.setTitle("Yes", for: .normal)
            option2.setTitle("No", for: .normal)
            option3.isHidden = true
            option4.isHidden = true
            qNum.text = "Question 2"
        }
        else if cq == 3
        {
            questions.text = "How often do you flush the toilet?"
            option1.setTitle("Everytime", for: .normal)
            option2.setTitle("Every time, but I conserve", for: .normal)
            option3.setTitle("Regularly", for: .normal)
            option3.isHidden = false
            option4.isHidden = true
            qNum.text = "Question 3"
        }
        else if cq == 4
        {
            questions.text = "What kind of clothing do you wear?"
            option1.setTitle("Brand New", for: .normal)
            option2.setTitle("Vintage or Second Use", for: .normal)
            option3.setTitle("A Pairing of Each", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 4"
        }
        else if cq == 5
        {
            questions.text = "How do you get from place to place?"
            option1.setTitle("Walk", for: .normal)
            option2.setTitle("Bicycle", for: .normal)
            option3.setTitle("Car or Truck", for: .normal)
            option4.setTitle("Bus", for: .normal)
            option4.isHidden = false
            qNum.text = "Question 5"
        }
        else if cq == 6
        {
            questions.text = "After eating, what do you discard?"
            option1.setTitle("Plastic", for: .normal)
            option2.setTitle("Paper", for: .normal)
            option3.setTitle("Nothing", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 6"
        }
        else if cq == 7
        {
            questions.text = "How often do you turn off the lights when you leave the room?"
            option1.setTitle("Always", for: .normal)
            option2.setTitle("Sometimes", for: .normal)
            option3.setTitle("Never", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 7"
        }
        else if cq == 8
        {
            questions.text = "Where do you mainly recycle or compost?"
            option1.setTitle("School", for: .normal)
            option2.setTitle("Work", for: .normal)
            option3.setTitle("Home", for: .normal)
            option4.setTitle("I don’t", for: .normal)
            option3.isHidden = false
            option4.isHidden = false
            qNum.text = "Question 8"
        }
        else if cq == 9
        {
            questions.text = "How would you describe your eating habits?"
            option1.setTitle("Vegan", for: .normal)
            option2.setTitle("Vegetarian", for: .normal)
            option3.setTitle("Some Meat", for: .normal)
            option4.setTitle("Meat with every meal", for: .normal)
            qNum.text = "Question 9"
        }
        else if cq == 10
        {
            questions.text = "How much leftover food do you have after each meal?"
            option1.setTitle("None", for: .normal)
            option2.setTitle("Just Scraps", for: .normal)
            option3.setTitle("Half", for: .normal)
            option4.setTitle("Not gonna lie, most of it", for: .normal)
            qNum.text = "Question 10"
        }
        else if cq == 11
        {
            questions.text = "Your score is \(score)"
            option1.isHidden = true
            option2.isHidden = true
            option3.isHidden = true
            option4.isHidden = true
            nextButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
            qNum.text = ""
            line.isHidden = true
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let fname = value?["first name"] as? String ?? ""
                let lname = value?["last name"] as? String ?? ""
                let pass = value?["password"] as? String ?? ""
                let email = value?["email"] as? String ?? ""
                let image = value?["img"] as? String ?? ""
                let values = ["first name" : fname, "last name" : lname, "email" : email, "password" : pass, "score" : "\(self.score)", "img" : image]
                ref.child("users").child(userID!).setValue(values)
            }) { (error) in
                print(error.localizedDescription)
            }

        }
    }
    @IBAction func option2Pressed(_ sender: UIButton) {
        if cq == 1
        {
            score += 1.66
        }
        else if cq == 2
        {
            score += 0.19
        }
        else if cq == 3
        {
            score += 0.37
        }
        else if cq == 4
        {
            score += 0
        }
        else if cq == 5
        {
            score += 0.06
        }
        else if cq == 6
        {
            score += 0.37
        }
        else if cq == 7
        {
            score += 0.46
        }
        else if cq == 8
        {
            score -= 0.37
        }
        else if cq == 9
        {
            score += 0.37
        }
        else if cq == 10
        {
            score += 0.61
        }
        cq+=1
        if cq == 1
        {
            questions.text = "How long do you spend in the shower?"
            option1.setTitle("<10", for: .normal)
            option2.setTitle("10-30", for: .normal)
            option3.setTitle(">30", for: .normal)
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
        }
        else if cq == 2
        {
            questions.text = "When brushing your teeth, do you turn off the tap?"
            option1.setTitle("Yes", for: .normal)
            option2.setTitle("No", for: .normal)
            option3.isHidden = true
            option4.isHidden = true
            qNum.text = "Question 2"
        }
        else if cq == 3
        {
            questions.text = "How often do you flush the toilet?"
            option1.setTitle("Everytime", for: .normal)
            option2.setTitle("Every time, but I conserve", for: .normal)
            option3.setTitle("Regularly", for: .normal)
            option3.isHidden = false
            option4.isHidden = true
            qNum.text = "Question 3"
        }
        else if cq == 4
        {
            questions.text = "What kind of clothing do you wear?"
            option1.setTitle("Brand New", for: .normal)
            option2.setTitle("Vintage or Second Use", for: .normal)
            option3.setTitle("A Pairing of Each", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 4"
        }
        else if cq == 5
        {
            questions.text = "How do you get from place to place?"
            option1.setTitle("Walk", for: .normal)
            option2.setTitle("Bicycle", for: .normal)
            option3.setTitle("Car or Truck", for: .normal)
            option4.setTitle("Bus", for: .normal)
            option4.isHidden = false
            qNum.text = "Question 5"
        }
        else if cq == 6
        {
            questions.text = "After eating, what do you discard?"
            option1.setTitle("Plastic", for: .normal)
            option2.setTitle("Paper", for: .normal)
            option3.setTitle("Nothing", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 6"
        }
        else if cq == 7
        {
            questions.text = "How often do you turn off the lights when you leave the room?"
            option1.setTitle("Always", for: .normal)
            option2.setTitle("Sometimes", for: .normal)
            option3.setTitle("Never", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 7"
        }
        else if cq == 8
        {
            questions.text = "Where do you mainly recycle or compost?"
            option1.setTitle("School", for: .normal)
            option2.setTitle("Work", for: .normal)
            option3.setTitle("Home", for: .normal)
            option4.setTitle("I don’t", for: .normal)
            option3.isHidden = false
            option4.isHidden = false
            qNum.text = "Question 8"
        }
        else if cq == 9
        {
            questions.text = "How would you describe your eating habits?"
            option1.setTitle("Vegan", for: .normal)
            option2.setTitle("Vegetarian", for: .normal)
            option3.setTitle("Some Meat", for: .normal)
            option4.setTitle("Meat with every meal", for: .normal)
            qNum.text = "Question 9"
        }
        else if cq == 10
        {
            questions.text = "How much leftover food do you have after each meal?"
            option1.setTitle("None", for: .normal)
            option2.setTitle("Just Scraps", for: .normal)
            option3.setTitle("Half", for: .normal)
            option4.setTitle("Not gonna lie, most of it", for: .normal)
            qNum.text = "Question 10"
        }
        else if cq == 11
        {
            questions.text = "Your score is \(score)"
            option1.isHidden = true
            option2.isHidden = true
            option3.isHidden = true
            option4.isHidden = true
            nextButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
            qNum.text = ""
            line.isHidden = true
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let fname = value?["first name"] as? String ?? ""
                let lname = value?["last name"] as? String ?? ""
                let pass = value?["password"] as? String ?? ""
                let email = value?["email"] as? String ?? ""
                let image = value?["img"] as? String ?? ""
                let values = ["first name" : fname, "last name" : lname, "email" : email, "password" : pass, "score" : "\(self.score)", "img" : image]
                ref.child("users").child(userID!).setValue(values)
            }) { (error) in
                print(error.localizedDescription)
            }

        }
    }
    @IBAction func option3Pressed(_ sender: UIButton) {
        if cq == 1
        {
            score += 2.4
        }
        else if cq == 3
        {
            score += 0.55
        }
        else if cq == 4
        {
            score += 0.92
        }
        else if cq == 5
        {
            score += 1.22
        }
        else if cq == 6
        {
            score += 0
        }
        else if cq == 7
        {
            score += 0.92
        }
        else if cq == 8
        {
            score -= 0.56
        }
        else if cq == 9
        {
            score += 1.11
        }
        else if cq == 10
        {
            score += 1.22
        }
        cq+=1
        if cq == 1
        {
            questions.text = "How long do you spend in the shower?"
            option1.setTitle("<10", for: .normal)
            option2.setTitle("10-30", for: .normal)
            option3.setTitle(">30", for: .normal)
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
        }
        else if cq == 2
        {
            questions.text = "When brushing your teeth, do you turn off the tap?"
            option1.setTitle("Yes", for: .normal)
            option2.setTitle("No", for: .normal)
            option3.isHidden = true
            option4.isHidden = true
            qNum.text = "Question 2"
        }
        else if cq == 3
        {
            questions.text = "How often do you flush the toilet?"
            option1.setTitle("Everytime", for: .normal)
            option2.setTitle("Every time, but I conserve", for: .normal)
            option3.setTitle("Regularly", for: .normal)
            option3.isHidden = false
            option4.isHidden = true
            qNum.text = "Question 3"
        }
        else if cq == 4
        {
            questions.text = "What kind of clothing do you wear?"
            option1.setTitle("Brand New", for: .normal)
            option2.setTitle("Vintage or Second Use", for: .normal)
            option3.setTitle("A Pairing of Each", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 4"
        }
        else if cq == 5
        {
            questions.text = "How do you get from place to place?"
            option1.setTitle("Walk", for: .normal)
            option2.setTitle("Bicycle", for: .normal)
            option3.setTitle("Car or Truck", for: .normal)
            option4.setTitle("Bus", for: .normal)
            option4.isHidden = false
            qNum.text = "Question 5"
        }
        else if cq == 6
        {
            questions.text = "After eating, what do you discard?"
            option1.setTitle("Plastic", for: .normal)
            option2.setTitle("Paper", for: .normal)
            option3.setTitle("Nothing", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 6"
        }
        else if cq == 7
        {
            questions.text = "How often do you turn off the lights when you leave the room?"
            option1.setTitle("Always", for: .normal)
            option2.setTitle("Sometimes", for: .normal)
            option3.setTitle("Never", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 7"
        }
        else if cq == 8
        {
            questions.text = "Where do you mainly recycle or compost?"
            option1.setTitle("School", for: .normal)
            option2.setTitle("Work", for: .normal)
            option3.setTitle("Home", for: .normal)
            option4.setTitle("I don’t", for: .normal)
            option3.isHidden = false
            option4.isHidden = false
            qNum.text = "Question 8"
        }
        else if cq == 9
        {
            questions.text = "How would you describe your eating habits?"
            option1.setTitle("Vegan", for: .normal)
            option2.setTitle("Vegetarian", for: .normal)
            option3.setTitle("Some Meat", for: .normal)
            option4.setTitle("Meat with every meal", for: .normal)
            qNum.text = "Question 9"
        }
        else if cq == 10
        {
            questions.text = "How much leftover food do you have after each meal?"
            option1.setTitle("None", for: .normal)
            option2.setTitle("Just Scraps", for: .normal)
            option3.setTitle("Half", for: .normal)
            option4.setTitle("Not gonna lie, most of it", for: .normal)
            qNum.text = "Question 10"
        }
        else if cq == 11
        {
            questions.text = "Your score is \(score)"
            option1.isHidden = true
            option2.isHidden = true
            option3.isHidden = true
            option4.isHidden = true
            nextButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
            qNum.text = ""
            line.isHidden = true
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let fname = value?["first name"] as? String ?? ""
                let lname = value?["last name"] as? String ?? ""
                let pass = value?["password"] as? String ?? ""
                let email = value?["email"] as? String ?? ""
                let image = value?["img"] as? String ?? ""
                let values = ["first name" : fname, "last name" : lname, "email" : email, "password" : pass, "score" : "\(self.score)", "img" : image]
                ref.child("users").child(userID!).setValue(values)
            }) { (error) in
                print(error.localizedDescription)
            }

        }
    }
    @IBAction func option4Pressed(_ sender: UIButton) {
        if cq == 5
        {
            score += 1.36
        }
        else if cq == 8
        {
            score -= 0
        }
        else if cq == 9
        {
            score += 1.85
        }
        else if cq == 10
        {
            score += 1.83
        }
        cq+=1
        if cq == 1
        {
            questions.text = "How long do you spend in the shower?"
            option1.setTitle("<10", for: .normal)
            option2.setTitle("10-30", for: .normal)
            option3.setTitle(">30", for: .normal)
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
        }
        else if cq == 2
        {
            questions.text = "When brushing your teeth, do you turn off the tap?"
            option1.setTitle("Yes", for: .normal)
            option2.setTitle("No", for: .normal)
            option3.isHidden = true
            option4.isHidden = true
            qNum.text = "Question 2"
        }
        else if cq == 3
        {
            questions.text = "How often do you flush the toilet?"
            option1.setTitle("Everytime", for: .normal)
            option2.setTitle("Every time, but I conserve", for: .normal)
            option3.setTitle("Regularly", for: .normal)
            option3.isHidden = false
            option4.isHidden = true
            qNum.text = "Question 3"
        }
        else if cq == 4
        {
            questions.text = "What kind of clothing do you wear?"
            option1.setTitle("Brand New", for: .normal)
            option2.setTitle("Vintage or Second Use", for: .normal)
            option3.setTitle("A Pairing of Each", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 4"
        }
        else if cq == 5
        {
            questions.text = "How do you get from place to place?"
            option1.setTitle("Walk", for: .normal)
            option2.setTitle("Bicycle", for: .normal)
            option3.setTitle("Car or Truck", for: .normal)
            option4.setTitle("Bus", for: .normal)
            option4.isHidden = false
            qNum.text = "Question 5"
        }
        else if cq == 6
        {
            questions.text = "After eating, what do you discard?"
            option1.setTitle("Plastic", for: .normal)
            option2.setTitle("Paper", for: .normal)
            option3.setTitle("Nothing", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 6"
        }
        else if cq == 7
        {
            questions.text = "How often do you turn off the lights when you leave the room?"
            option1.setTitle("Always", for: .normal)
            option2.setTitle("Sometimes", for: .normal)
            option3.setTitle("Never", for: .normal)
            option4.isHidden = true
            qNum.text = "Question 7"
        }
        else if cq == 8
        {
            questions.text = "Where do you mainly recycle or compost?"
            option1.setTitle("School", for: .normal)
            option2.setTitle("Work", for: .normal)
            option3.setTitle("Home", for: .normal)
            option4.setTitle("I don’t", for: .normal)
            option3.isHidden = false
            option4.isHidden = false
            qNum.text = "Question 8"
        }
        else if cq == 9
        {
            questions.text = "How would you describe your eating habits?"
            option1.setTitle("Vegan", for: .normal)
            option2.setTitle("Vegetarian", for: .normal)
            option3.setTitle("Some Meat", for: .normal)
            option4.setTitle("Meat with every meal", for: .normal)
            qNum.text = "Question 9"
        }
        else if cq == 10
        {
            questions.text = "How much leftover food do you have after each meal?"
            option1.setTitle("None", for: .normal)
            option2.setTitle("Just Scraps", for: .normal)
            option3.setTitle("Half", for: .normal)
            option4.setTitle("Not gonna lie, most of it", for: .normal)
            qNum.text = "Question 10"
        }
        else if cq == 11
        {
            questions.text = "Your score is \(score)"
            option1.isHidden = true
            option2.isHidden = true
            option3.isHidden = true
            option4.isHidden = true
            nextButton.isHidden = false
            nextButton.setTitle("Next", for: .normal)
            qNum.text = ""
            line.isHidden = true
            let ref = Database.database().reference()
            let userID = Auth.auth().currentUser?.uid
            ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let fname = value?["first name"] as? String ?? ""
                let lname = value?["last name"] as? String ?? ""
                let pass = value?["password"] as? String ?? ""
                let email = value?["email"] as? String ?? ""
                let image = value?["img"] as? String ?? ""
                let values = ["first name" : fname, "last name" : lname, "email" : email, "password" : pass, "score" : "\(self.score)", "img" : image]
                ref.child("users").child(userID!).setValue(values)
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func next(_ sender: UIButton) {
        if cq == 0
        {
            cq+=1
            questions.text = "How long do you spend in the shower?"
            option1.setTitle("<10", for: .normal)
            option2.setTitle("10-30", for: .normal)
            option3.setTitle(">30", for: .normal)
            option1.isHidden = false
            option2.isHidden = false
            option3.isHidden = false
            nextButton.isHidden = true
            qNum.text = "Question 1"
            line.isHidden = false
        }
        else if cq == 11
        {
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! MainViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
        
    }
    
}



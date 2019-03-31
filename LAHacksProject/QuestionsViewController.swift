//
//  QuestionsViewController.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/30/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questions: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    var cq = 1;
    var score = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions.text = "How long do you spend in the shower?"
        option1.setTitle("<10", for: .normal)
        option2.setTitle("10-30", for: .normal)
        option3.setTitle(">30", for: .normal)
        option4.isHidden = true
        
        
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
    }
    @IBAction func option2Pressed(_ sender: UIButton) {
    }
    @IBAction func option3Pressed(_ sender: UIButton) {
    }
    @IBAction func option4Pressed(_ sender: UIButton) {
    }
    
    @IBAction func next(_ sender: UIButton) {
        cq+=1
        if cq == 2
        {
            questions.text = "When brushing your teeth, do you turn off the tap?"
            option1.setTitle("Yes", for: .normal)
            option2.setTitle("No", for: .normal)
            option3.isHidden = true
            option4.isHidden = true
        }
        else if cq == 3
        {
            questions.text = "How often do you flush the toilet?"
            option1.setTitle("Everytime", for: .normal)
            option2.setTitle("Every time, but I conserve", for: .normal)
            option3.setTitle("Regularly", for: .normal)
            option3.isHidden = false
            option4.isHidden = true
        }
        else if cq == 4
        {
            questions.text = "What kind of clothing do you wear?"
            option1.setTitle("Brand New", for: .normal)
            option2.setTitle("Vintage or Second Use", for: .normal)
            option3.setTitle("A Pairing of Each", for: .normal)
            option4.isHidden = true
        }
        else if cq == 5
        {
            questions.text = "How do you get from place to place?"
            option1.setTitle("Walk", for: .normal)
            option2.setTitle("Bicycle", for: .normal)
            option3.setTitle("Car or Truck", for: .normal)
            option4.setTitle("Bus", for: .normal)
            option4.isHidden = false
        }
        else if cq == 6
        {
            questions.text = "After eating, what do you discard?"
            option1.setTitle("Plastic", for: .normal)
            option2.setTitle("Paper", for: .normal)
            option3.setTitle("Nothing", for: .normal)
            option4.isHidden = true
        }
        else if cq == 7
        {
            questions.text = "How often do you turn off the lights when you leave the room?"
            option1.setTitle("Always", for: .normal)
            option2.setTitle("Sometimes", for: .normal)
            option3.setTitle("Never", for: .normal)
            option4.isHidden = true
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
        }
        else if cq == 9
        {
            questions.text = "How would you describe your eating habits?"
            option1.setTitle("Vegan", for: .normal)
            option2.setTitle("Vegetarian", for: .normal)
            option3.setTitle("Some Meat", for: .normal)
            option4.setTitle("Meat with every meal", for: .normal)
        }
        else if cq == 10
        {
            questions.text = "How much leftover food do you have after each meal?"
            option1.setTitle("None", for: .normal)
            option2.setTitle("Just Scraps", for: .normal)
            option3.setTitle("Half", for: .normal)
            option4.setTitle("Not gonna lie, most of it", for: .normal)
        }
        else if cq == 11
        {
            questions.text = "Your score is \(score)"
        }
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Main") as! MainViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
        
    }
    
}



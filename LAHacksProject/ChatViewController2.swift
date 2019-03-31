//
//  ChatViewController2.swift
//  LAHacksProject
//
//  Created by Mehul Tailang on 3/31/19.
//  Copyright © 2019 Mehul Tailang. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController2: UIViewController {


    var messageArray : [Message] = [Message]()
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configureTableView()
        let messageDB = Database.database().reference().child("Messages")
        tableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            print(snapshot)
            let message = Message()
            message.messageBody = text
            message.sender = sender
            
            self.messageArray.append(message)
            print(self.messageArray)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String! {
            
            //Set background to blue if message is from logged in user.
            cell.avatarImageView.backgroundColor = UIColor.green
            cell.messageBackground.backgroundColor = UIColor.blue
            
        } else {
            
            //Set background to grey if message is from another user.
            cell.avatarImageView.backgroundColor = UIColor.gray
            cell.messageBackground.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120.0
    }
    @IBAction func sendMessage(_ sender: UIButton) {
        text.endEditing(true)
        text.isEnabled = false
        sendButton.isEnabled = false
        let messagesDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                                 "MessageBody": text.text!]
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            }
            else {
                print("Message saved successfully!")
            }
        }
        text.text = ""
        text.isEnabled = true
        sendButton.isEnabled = true
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        performSegue(withIdentifier: "chat", sender: self)
    }
    


}

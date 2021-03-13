//
//  chatViewController.swift
//  parseChatDemo
//
//  Created by Anh Nguyen on 3/13/21.
//

import UIKit
import Parse

class chatViewController: UIViewController {
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
           if success {
              print("The message was saved!")
           } else if let error = error {
              print("Problem saving message: \(error.localizedDescription)")
           }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

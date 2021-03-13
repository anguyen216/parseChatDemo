//
//  LoginViewController.swift
//  parseChatDemo
//
//  Created by Anh Nguyen on 3/13/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerUser(_ sender: Any) {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
            }
        }
    }
    
    @IBAction func loginUser(_ sender: Any) {
        
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
             if let error = error {
               print("User log in failed: \(error.localizedDescription)")
             } else {
               print("User logged in successfully")
               // display view controller that needs to shown after successful login
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

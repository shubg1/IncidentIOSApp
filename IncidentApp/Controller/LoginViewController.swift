//
//  LoginViewController.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 22/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var validation = Validation()
    var alert  = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LoginAction(_ sender: Any) {
        
        guard let name = userName.text, name != "",
              let userPassword = password.text, userPassword != "" else {
                self.alert.showAlert(vc: self, title:  "message", message: "username or password should not empty")
                return
        }
        let isValidateName = self.validation.validateName(name: name)
        if (isValidateName == false) {
            self.alert.showAlert(vc: self, title:  "message", message: "username should be at least 8 characters in length and alphabetic")
           return
        }
        let isValidatePass = self.validation.validatePassword(password: userPassword)
        if (isValidatePass == false) {
            self.alert.showAlert(vc: self, title:  "message", message:"password should be at least 8 characters in length")
           return
        }
        if (isValidateName == true && isValidatePass == true) {
            let vc: UIViewController? = storyboard?.instantiateViewController(withIdentifier: "home")
            self.navigationController?.pushViewController(vc!, animated: true)
           
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
           return true;
       }
}


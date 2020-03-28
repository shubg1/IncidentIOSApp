//
//  Validtion.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 22/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import Foundation

class Validation {
    public func validateName(name: String) ->Bool {
    // The username should be at least 8 characters in length and alphabetic.
      let nameRegex = "^[A-Za-z]{8,}$"
      let trimmedString = name.trimmingCharacters(in: .whitespaces)
      let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
      let isValidateName = validateName.evaluate(with: trimmedString)
      return isValidateName
   }
 
   public func validatePassword(password: String) -> Bool {
     // The password should be at least 8 characters in length.
      let passRegEx = "^.{8,}$"
      let trimmedString = password.trimmingCharacters(in: .whitespaces)
      let validatePassword = NSPredicate(format:"SELF MATCHES %@", passRegEx)
      let isvalidatePass = validatePassword.evaluate(with: trimmedString)
      return isvalidatePass
   }
}

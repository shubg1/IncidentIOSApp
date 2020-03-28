//
//  Alert.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 22/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import Foundation
import UIKit

class Alert {

public func showAlert(vc: UIViewController, title: String, message: String) {
let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
        //Ok Action
    }))
     DispatchQueue.main.async {
     vc.present(alert, animated: true, completion: nil)
   }
 }
}


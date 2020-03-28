//
//  IncidentReportingViewController.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 12/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//
import CoreData
import UIKit

class IncidentReportingViewController: UIViewController,UITextFieldDelegate {

    var incidentManageObj: [NSManagedObject] = []
    
    @IBOutlet weak var incidentId: UITextField!
    @IBOutlet weak var machineName: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var descriptions: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  @IBAction func reportIncidentAction(_ sender: Any) {
    
    
     guard let id = incidentId.text, id != "",
           let name = machineName.text, name != "",
           let loc = location.text, loc != "",
           let description = descriptions.text, description != "" else {
               return
              }
    
    let dataModel = IncidentModel();
    dataModel.machineid = incidentId.text
    dataModel.machinename = machineName.text
    dataModel.location = location.text
    dataModel.descriptions = descriptions.text
    dataModel.submissiontime = Date.getCurrentDate()
    
    IncidentRecord.saveIncidentToDb(dataModel:dataModel){
     self.navigationController?.popViewController(animated: true)
    }
  }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
           return true;
       }
}

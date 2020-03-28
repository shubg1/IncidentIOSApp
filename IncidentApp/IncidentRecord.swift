//
//  IncidentRecord.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 21/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//
import CoreData
import Foundation

class IncidentRecord {

    var incidentManageObj: [NSManagedObject] = []
    
    class func saveIncidentToDb( dataModel:IncidentModel,_ completionBlock : @escaping ()->()) {
        if dataModel.machinename != nil {
                  let context = CoreDataStack.persistentContainer.viewContext
                  let currentIncident = Incident(context:context)
                  currentIncident.descriptions = dataModel.descriptions;
                  currentIncident.location = dataModel.location;
                  currentIncident.machineid = dataModel.machineid;
                  currentIncident.machinename = dataModel.machinename;
                  currentIncident.submissiontime = dataModel.submissiontime;
            
                  CoreDataStack.saveContext()
                  completionBlock()
              }else{
                  // Do nothing -  no error, response is empty
              }
           
          }
    
    class func loadIncidentFromDb() -> [IncidentModel] {
           let context = CoreDataStack.persistentContainer.viewContext
           var viewModelArray = [IncidentModel]()
           do {
               let incidents : [Incident] = try context.fetch(Incident.fetchRequest())
               if incidents.count > 0{
                   for incident in incidents{
                    
                       let viewModel = IncidentModel(data: incident)
                       viewModelArray.append(viewModel!)
                   }
               }
           }catch {
               print("Error fetching data from CoreData")
           }
           return viewModelArray
       }
    
}

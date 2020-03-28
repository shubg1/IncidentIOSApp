//
//  IncidentViewModel.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 21/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import UIKit

class IncidentViewModel: NSObject {
    var tableitems = [IncidentModel]()
    let cellReuseIdentifier = "homeCell"
    
    func refreshWith(data: Array<Any>, _ completionBlock : @escaping ()->()) {
        self.tableitems = data as! [IncidentModel]
        completionBlock()
    }
}

extension IncidentViewModel: UITableViewDataSource,UISearchBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return tableitems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = tableitems[indexPath.row]
        if let cell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? HomeTableViewCell{
            cell.machinId.text = item.machineid
            cell.machinName.text = item.machinename
            cell.submissiontime.text = item.submissiontime
            return cell
        }
        return UITableViewCell()
    }
    
}


class IncidentModel: NSObject {
    
    var machineid:String?
    var machinename:String?
    var location:String?
    var descriptions:String?
    var submissiontime:String?
    override init() {}

    init?(data:Incident) {
        
      self.machineid = data.machineid
      self.machinename = data.machinename
      self.location = data.location
      self.descriptions = data.descriptions
      self.submissiontime = data.submissiontime
    }
}

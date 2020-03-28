//
//  HomeTableViewCell.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 21/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet var machinId: UILabel!
    @IBOutlet var machinName: UILabel!
    @IBOutlet var submissiontime: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

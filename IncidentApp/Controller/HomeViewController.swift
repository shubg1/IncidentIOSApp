//
//  HomeViewController.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 21/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var homeTableView: UITableView!
    let cellReuseIdentifier = "homeCell"
    lazy var incidents : [IncidentModel] = []
    fileprivate let viewModel = IncidentViewModel()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        homeTableView?.dataSource = viewModel
        homeTableView?.estimatedRowHeight = 100
        homeTableView?.rowHeight = UITableView.automaticDimension
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.returnKeyType = UIReturnKeyType.done
        incidents = IncidentRecord.loadIncidentFromDb()
        viewModel.refreshWith(data: incidents, {
            self.homeTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        let incidents = IncidentRecord.loadIncidentFromDb()
        viewModel.refreshWith(data: incidents, {
            self.homeTableView.reloadData()
        })
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == ""{
            viewModel.refreshWith(data: incidents, {
                self.homeTableView.reloadData()
            })
        }
        else{
            let resultPredicate = NSPredicate(format: "SELF contains %@", searchText.lowercased())
            let searchResults = incidents.filter { resultPredicate.evaluate(with: $0.machinename?.lowercased()) || resultPredicate.evaluate(with: $0.machineid?.lowercased()) || resultPredicate.evaluate(with: $0.submissiontime?.lowercased()) }
            viewModel.refreshWith(data: searchResults, {
                self.homeTableView.reloadData()
            })
        }
        
    }
    
}

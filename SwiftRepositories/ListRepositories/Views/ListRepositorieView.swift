//
//  ListRepositorieView.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import UIKit

protocol ListRepositorieViewDelegate {
    func reloadTableView()
}

class ListRepositorieView: UIView {
    
    //MARK: - Properties
    var delegate: ListRepositorieViewDelegate?
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var refreshControl = UIRefreshControl()
    
    // MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension ListRepositorieView: CodeView {
    
    // MARK: - Methods
     func setupComponents() {
         addSubview(tableView)
         tableView.addSubview(refreshControl)
     }
     
     func setupConstraints() {
        //TableView
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
     }
     
     func setupExtraConfigurations() {
        tableView.register(ListRepositorieTableViewCell.self, forCellReuseIdentifier: "ListRepositorieTableViewCell")
     }
    
     @objc func refresh(_ sender: AnyObject) {
   
        delegate?.reloadTableView()
        
     }
    
}

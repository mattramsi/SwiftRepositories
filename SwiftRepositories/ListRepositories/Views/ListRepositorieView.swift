//
//  ListRepositorieView.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import UIKit

class ListRepositorieView: UIView {
    
    //MARK: - Properties
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Inits
    init() {
        super.init(frame: .zero)
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
     }
     
     func setupConstraints() {
         
     }
     
     func setupExtraConfigurations() {
        tableView.register(ListRepositorieTableViewCell.self, forCellReuseIdentifier: "ListRepositorieTableViewCell")
     }
    
}

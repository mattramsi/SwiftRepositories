//
//  ViewController.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 25/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import UIKit

class ListRepositorieViewController: UIViewController {
    
    // MARK: - Properties
    lazy var viewModel = ListRepositorieViewModel()
    var coordinator: ListRepositorieCoordinator?
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 22))
        label.text = "Não existe repositórios de Swift"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listRepositorieView = ListRepositorieView()
        view = listRepositorieView
        listRepositorieView.tableView.delegate = self
        

    }
    
    deinit {
        coordinator?.childDidFinish(nil)
    }

}

extension ListRepositorieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.backgroundView = viewModel.count == 0 ? label : nil
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListRepositorieTableViewCell", for: indexPath) as? ListRepositorieTableViewCell else {
            return UITableViewCell()
        }
        
//        cell.configure(with: )
        
        return cell
        
    }
    
    
    
}


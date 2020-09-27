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
    var viewModel = ListRepositorieViewModel()
    var coordinator: ListRepositorieCoordinator?
    var listRepositorieView: ListRepositorieView!
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 22))
        label.text = "Não existe repositórios de Swift"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Repositories Swift"
        
        listRepositorieView = ListRepositorieView(frame: view.frame)
        view = listRepositorieView
        listRepositorieView.delegate = self
        listRepositorieView.tableView.delegate = self
        listRepositorieView.tableView.dataSource = self
        
        loadRepositories()
    }
    
    private func loadRepositories() {
        
        viewModel.loadRepositories()  { (result) in
            
            switch result {
                
            case .success(let listRepository):
                
                self.viewModel = ListRepositorieViewModel(model: listRepository.items.map(RepositoryViewModel.init))
                
                DispatchQueue.main.async {
                    self.listRepositorieView.tableView.reloadData()
                    self.listRepositorieView.refreshControl.endRefreshing()
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListRepositorieTableViewCell", for: indexPath) as? ListRepositorieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: viewModel.getRepositoryAt(at: indexPath.row))
        
        return cell
        
    }
    
    
    
}


extension ListRepositorieViewController: ListRepositorieViewDelegate {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.loadRepositories()
        }
    }
    
    
    
}

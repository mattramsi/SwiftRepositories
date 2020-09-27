//
//  RepositoriesTest.swift
//  RepositoriesTest
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import Quick
import Nimble
import FBSnapshotTestCase

@testable import SwiftRepositories

class RepositoriesTest: QuickSpec {
    
    
    override func spec() {
        describe("ListRepositoryViewSpec") {
            
            var viewController: ListRepositorieViewController!
            var view: ListRepositorieView!
            
            beforeEach {
                
                viewController = ListRepositorieViewController()
                view = ListRepositorieView()
                
                viewController.viewModel = ListRepositorieViewModel(model: [RepositoryViewModel(repository: Repository(name: "MatheusRep", stars: 30, owner: Owner(author: "Matheus", avatarImage: "https://en.wikipedia.org/wiki/File:Image_created_with_a_mobile_phone.png")))])
                
                viewController.listRepositorieView = view
                viewController.listRepositorieView.tableView.delegate = viewController
                viewController.listRepositorieView.tableView.dataSource = viewController
      
                
            }
            
            it("should return the right number of rows") {
                expect(viewController.tableView(viewController.listRepositorieView.tableView, numberOfRowsInSection: 0)) == 1
            }
            
            it("should return the right number of sections") {
                expect(viewController.numberOfSections(in: viewController.listRepositorieView.tableView)) == 1
            }

            
            it("should return MatheusRep if user select first Cell") {
                
                let indexPath = IndexPath(row: 0, section: 0)
                let repository = viewController.viewModel.getRepositoryAt(at: indexPath.row)
                
                expect(repository.name) == "MatheusRep"
            }
        }
    }
    
}


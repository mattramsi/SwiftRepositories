//
//  ListRepositorieViewModel.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//
import Foundation

class ListRepositorieViewModel {
    
    var repositories = [RepositoryViewModel]()
    
    init(model: [RepositoryViewModel]? = nil) {
        if let inputModel = model {
           repositories = inputModel
        }
    }
    
    var count: Int {
        return repositories.count
    }
    
    func loadRepositories(onComplete: @escaping (Result<ListRepository, APIError>) -> Void){

        RepositoryAPI.shared.loadRepositories(onComplete: onComplete)
    }
    
    func getRepositoryAt(at index: Int) -> RepositoryViewModel {
        return repositories[index]
    }
    
}

class RepositoryViewModel {
    
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    var name: String {
        return repository.name
    }
    
    var author: String {
        return repository.owner.author
    }
    
    var stars: String {
        return "\(repository.stars)"
    }
    
    var imageUrl: String {
        return repository.owner.avatarImage
    }
}

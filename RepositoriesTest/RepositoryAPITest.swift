//
//  RepositoryAPITest.swift
//  RepositoriesTest
//
//  Created by Matheus Ramos on 27/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import XCTest
@testable import SwiftRepositories


class RepositoryAPITest: XCTestCase {

   
    func testGetRepositoriesWithExpectedURL() {
        let respositoryApi = RepositoryAPI.shared
        XCTAssertEqual(respositoryApi.basePath, "https://api.github.com/search/repositories?q=language:swift&sort=stars")
    }
    
    func testGetRepositoriesSuccessReturnsMovies() {
        
        let apiRespository = RepositoryAPI.shared
        let repositoriesExpectation = expectation(description: "repositories")
        var repositoriesResponse: [Repository]?
        
        apiRespository.loadRepositories { (result) in
            
            switch result {
            case .success(let listRepository):
                repositoriesResponse = listRepository.items
                break
            case .failure(_): break
            }
            
            repositoriesExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 2) { (error) in
            XCTAssertNotNil(repositoriesResponse)
        }
        
    }
    
}

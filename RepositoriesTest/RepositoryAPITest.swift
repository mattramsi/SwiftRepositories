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
    
    func testGetSuccessReturnsRepositories() {
        
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
        
        waitForExpectations(timeout: 4) { (error) in
            XCTAssertNotNil(repositoriesResponse)
        }
        
    }
    
    func testSuccessfulResponse() {
      // Prepare mock response.
      let apiRespository = RepositoryAPI.shared
        let exp = expectation(description: "Expectation")
      let userID = "Matheus"
      let id = 42
      let title = "URLProtocol Pos"
 
      let jsonString = """
                       {
                        "items": [
                            {
                              "full_name": "\(userID)",
                              "stargazers_count": \(id),
                              "owner":  {
                                 "login": "\(title)",
                                 "avatar_url": "https://en.wikipedia.org/wiki/File:Image_created_with_a_mobile_phone.png"
                                }
                            }
                         ]
                       }
                       """
      let data = jsonString.data(using: .utf8)
        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        apiRespository.session = urlSession
      
      MockURLProtocol.requestHandler = { request in
        guard let url = request.url, url == URL(string: RepositoryAPI.shared.basePath) else {
          throw APIResponseError.request
        }
        
        let response = HTTPURLResponse(url: URL(string: RepositoryAPI.shared.basePath)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        return (response, data)
      }
      
      // Call API.
      apiRespository.loadRepositories { (result) in
        switch result {
        case .success(let post):
            XCTAssertEqual(post.items[0].name, userID, "Incorrect userID.")
            XCTAssertEqual(post.items[0].stars,  id, "Incorrect id.")
//          XCTAssertEqual(post.title, title, "Incorrect title.")
//          XCTAssertEqual(post.body, body, "Incorrect body.")
        case .failure(let error):
          XCTFail("Error was not expected: \(error)")
        }
        
        exp.fulfill()
      }
        
      wait(for: [exp], timeout: 1.0)
    }

//
//    func testParsingFailure() {
//      // Prepare response
//        let apiRespository = RepositoryAPI.shared
//      let data = Data()
//        let exp = expectation(description: "Expectation")
//        
//           let configuration = URLSessionConfiguration.default
//           configuration.protocolClasses = [MockURLProtocol.self]
//           let urlSession = URLSession.init(configuration: configuration)
//           apiRespository.session = urlSession
//        
//      MockURLProtocol.requestHandler = { request in
//        let response = HTTPURLResponse(url: URL(string: RepositoryAPI.shared.basePath)!, statusCode: 200, httpVersion: nil, headerFields: nil)!
//        return (response, data)
//      }
//        
//        
//      // Call API.
//      apiRespository.loadRepositories { (result) in
//        switch result {
//        case .success(_):
//          XCTFail("Success response was not expected.")
//        case .failure(let error):
//          guard let error = error as? APIResponseError else {
//            XCTFail("Incorrect error received.")
//            exp.fulfill()
//            return
//          }
//          
//          XCTAssertEqual(error, APIResponseError.parsing, "Parsing error was expected.")
//        }
//        
//        exp.fulfill()
//      }
//        
//      wait(for: [exp], timeout: 1.0)
//    }
    
}

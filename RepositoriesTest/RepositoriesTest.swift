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

protocol URLSessionDataTaskProtocol {
  func resume()
  func cancel()
}

protocol URLSessionProtocol {
  func dataTask(
    with request: URLRequest,
    completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
  ) -> URLSessionDataTask
}

extension URLSession : URLSessionProtocol{}
extension URLSessionDataTask : URLSessionDataTaskProtocol{}

class MockURLProtocol: URLProtocol {
  
  override class func canInit(with request: URLRequest) -> Bool {
    // To check if this protocol can handle the given request.
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    // Here you return the canonical version of the request but most of the time you pass the orignal one.
    return request
  }

  // 1. Handler to test the request and return mock response.
  static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    
  override func startLoading() {
    guard let handler = MockURLProtocol.requestHandler else {
      fatalError("Handler is unavailable.")
    }
      
    do {
      // 2. Call handler with received request and capture the tuple of response and data.
      let (response, data) = try handler(request)
      
      // 3. Send received response to the client.
      client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
      
      if let data = data {
        // 4. Send received data to the client.
        client?.urlProtocol(self, didLoad: data)
      }
      
      // 5. Notify request has been finished.
      client?.urlProtocolDidFinishLoading(self)
    } catch {
      // 6. Notify received error.
      client?.urlProtocol(self, didFailWithError: error)
    }
  }

  override func stopLoading() {
    // This is called if the request gets canceled or completed.
  }
}


enum APIResponseError: Error {
    case request, network, parsing
}

//class PostAPITest: XCTestCase {
//  var postDetailAPI: PostDetailAPI!
//  var expectation: XCTestExpectation!
//  let apiURL = URL(string: "https://jsonplaceholder.typicode.com/posts/42")!
//  
//  override func setUp() {
//    let configuration = URLSessionConfiguration.default
//    configuration.protocolClasses = [MockURLProtocol.self]
//    let urlSession = URLSession.init(configuration: configuration)
//    
//    postDetailAPI = PostDetailAPI(urlSession: urlSession)
//    expectation = expectation(description: "Expectation")
//  }
//}
//

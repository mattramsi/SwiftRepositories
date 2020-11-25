//
//  SwiftRepositoriesSnapshotsTests.swift
//  SwiftRepositoriesSnapshotsTests
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

@testable import SwiftRepositories

class SwiftRepositoriesSnapshotsTests: FBSnapshotTestCase {

    var sut: ListRepositorieViewController!

    override func setUp() {
        super.setUp()
        
        //usesDrawViewHierarchyInRect = true
        fileNameOptions = [.device, .screenSize, .OS]
        
        sut = ListRepositorieViewController()
        recordMode = false
    }
    
    override func tearDown() {
         sut = nil
         super.tearDown()
     }
    
    func testView() {

        //Give
//        sut.viewModel = ListRepositorieViewModel(model: [RepositoryViewModel(repository: Repository(name: "MatheusRep", stars: 30, owner: Owner(author: "Matheus", avatarImage: "https://avatars2.githubusercontent.com/u/484656?v=4")))])
//
//        //When
//        sut.beginAppearanceTransition(true, animated: false)
//        sut.endAppearanceTransition()

        //Then
//        FBSnapshotVerifyView(sut.view)
    }
}

//
//  ListRepository.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import UIKit

struct ListRepository: Codable {
    
    var items: [Repository] = []
    
}

struct Repository: Codable {
    
    
    var name: String
    var stars: Int
    var owner: Owner

    enum CodingKeys: String, CodingKey {
       case name = "full_name"
       case stars = "stargazers_count"
       case owner = "owner"
    }
    
}


struct Owner: Codable {
    
    var author: String
    var avatarImage: String
    
    enum CodingKeys: String, CodingKey {
       case author = "login"
       case avatarImage = "avatar_url"
    }
    
}

//
//  CodeView.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation

protocol CodeView {
    
    func setup()
    
    func setupComponents()
    
    func setupConstraints()
    
    func setupExtraConfigurations()
}

extension CodeView {
    
    func setup() {
        
        setupComponents()
        
        setupConstraints()
        
        setupExtraConfigurations()
    }
}



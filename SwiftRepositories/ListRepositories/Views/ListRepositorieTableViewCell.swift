//
//  ListRepositorieTableViewCell.swift
//  SwiftRepositories
//
//  Created by Matheus Ramos on 26/09/20.
//  Copyright © 2020 Matheus. All rights reserved.
//

import Foundation
import UIKit

class ListRepositorieTableViewCell: UITableViewCell {
    
    //MARK - Properties
    let nameRepositoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16)
        label.text = "Teste"
        return label
    }()
    
    let nameAuthorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16)
        label.text = "Teste"
        return label
    }()
    
    let starsLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16)
        label.text = "Teste"
        return label
    }()
    
    let avatarImageView: UIImageView = {
       let imageView = UIImageView(frame: .zero)
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    //MARK: - Methods
    func configure(with viewModel: RepositoryModel) {
        setup()
        nameRepositoryLabel.text = viewModel.name
        nameAuthorLabel.text = viewModel.author
        starsLabel.text = viewModel.stars
        UIImage.loadFrom(url: URL(string: viewModel.imageUrl)!) { [weak self] image in
            self?.avatarImageView.image = image
        }
    }
}

extension ListRepositorieTableViewCell: CodeView {
    
    func setupComponents() {
        addSubview(nameRepositoryLabel)
        addSubview(nameAuthorLabel)
        addSubview(starsLabel)
        addSubview(avatarImageView)
    }
    
    func setupConstraints() {
        
        nameRepositoryLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        nameRepositoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        nameAuthorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        nameAuthorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        starsLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        starsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        avatarImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupExtraConfigurations() {
        
    }
    
}

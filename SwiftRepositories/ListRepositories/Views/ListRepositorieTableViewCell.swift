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
        label.numberOfLines = 0
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
    func configure(with viewModel: RepositoryViewModel) {
        setup()
        nameRepositoryLabel.text = "Repository name: \(viewModel.name)"
        nameAuthorLabel.text = "Author: \(viewModel.author)"
        starsLabel.text = "Stars: \(viewModel.stars)"
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
        
        avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        
        nameRepositoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        nameRepositoryLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10).isActive = true
        nameRepositoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        nameAuthorLabel.topAnchor.constraint(equalTo: nameRepositoryLabel.bottomAnchor, constant: 20).isActive = true
        nameAuthorLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10).isActive = true

        starsLabel.topAnchor.constraint(equalTo: nameRepositoryLabel.bottomAnchor, constant: 20).isActive = true
        starsLabel.leadingAnchor.constraint(equalTo: nameAuthorLabel.trailingAnchor, constant: 10).isActive = true

    }
    
    func setupExtraConfigurations() {
        
    }
    
}

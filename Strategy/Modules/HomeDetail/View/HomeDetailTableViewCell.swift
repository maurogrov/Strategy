//
//  HomeDetailTableView.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    
    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var contentStackView: UIView = {
        var view = UIView()
        return view
    }()
    private lazy var headerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalCentering
        return stack
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = label.font.withSize(24)
        label.textColor = ColorStrategy.TextColorLayerOne.color
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = label.font.withSize(16)
        label.textColor = ColorStrategy.TextColorLayerTwo.color
        return label
    }()
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = label.font.withSize(15)
        label.textColor = ColorStrategy.TextColorLayerOne.color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        [contentStackView,avatarImageView]
            .forEach(contentView.addSubview)
        
        contentStackView.addSubview(headerStackView)

        self.backgroundColor = ColorStrategy.BackgroundLayerOne.color        
        avatarImageView.backgroundColor = ColorStrategy.BackgroundLayerTwo.color
        avatarImageView.layer.borderWidth = 1
        avatarImageView.layer.borderColor = ColorStrategy.BackgroundLayerThree.cgColor
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        contentStackView.backgroundColor = ColorStrategy.BackgroundLayerTwo.color
        contentStackView.layer.cornerRadius = 10
        contentStackView.clipsToBounds = true
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            contentStackView.topAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: 30),
            contentStackView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
        ])
        
       
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            headerStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            headerStackView.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 10),
            headerStackView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: -10),
        ])
            
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(descriptionLabel)
        headerStackView.addArrangedSubview(tagLabel)
    
    }
    
    func configure(with model: DetailViewModel) {
        avatarImageView.loadFrom(URLAddress: model.strUrlImage)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        tagLabel.text = model.tag
    }
}

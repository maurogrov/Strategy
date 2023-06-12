//
//  HomeView.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

class HomeView: UIViewController {
    
    var presenter: HomeViewPresenterProtocol?
    
    private var homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.image = StrategyImage.pokeball.image
        return imageView
    }()
    
    private lazy var goToButton: UIButton = {
       let button = UIButton()
        button.setTitle(StrategyStrings.find.rawValue, for: .normal)
        button.addTarget(self, action: #selector(didTapOnCreateRequest), for: .touchUpInside)
        button.titleLabel?.textColor = .black
        button.backgroundColor = ColorStrategy.ButtonLayerOne.color
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = label.font.withSize(20)
        label.textColor = ColorStrategy.TextColorLayerTwo.color
        label.text = StrategyStrings.canYouFind.rawValue
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    private func configLayout() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        [homeImageView, goToButton, titleLabel].forEach(view.addSubview)
        
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            homeImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -40),
            homeImageView.widthAnchor.constraint(equalToConstant: 200),
            homeImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: homeImageView.bottomAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: goToButton.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        goToButton.layer.cornerRadius = 10
        
        goToButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            goToButton.heightAnchor.constraint(equalToConstant: 75),
            goToButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            goToButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            goToButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func didTapOnCreateRequest(){
        self.presenter?.goTo(.Detail)
        
    }
}

extension HomeView : HomePresenterViewProtocol { }

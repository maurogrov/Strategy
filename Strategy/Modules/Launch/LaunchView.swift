//
//  LaunchView.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 10/06/23.
//

import UIKit

class LaunchView: UIViewController {
    
    let vc = HomeWireFrame().createModule()
    
    private var homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.image = StrategyImage.strategy.image
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = StrategyStrings.nameApp.rawValue
        label.font = label.font.withSize(24)
        label.numberOfLines = 1
        label.textColor = ColorStrategy.TextColorLayerOne.color
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimation(completion: {
            self.goTo()
        })
    }
    
    private func configLayout() {
        self.view.backgroundColor = ColorStrategy.BackgroundLayerOne.color
        self.navigationController?.navigationBar.isHidden = true
        
        [homeImageView, titleLabel].forEach(view.addSubview)
        
        homeImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            homeImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            homeImageView.widthAnchor.constraint(equalToConstant: 200),
            homeImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: homeImageView.bottomAnchor, constant: 40)
        ])
    }
    
    func setupAnimation(completion: @escaping() -> Void){
        let duration = 0.4
        UIView.animate(withDuration: duration, animations: {
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: { _ in
            UIView.animate(withDuration: duration, animations: {
                self.titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: {_ in
                UIView.animate(withDuration: duration, animations: {
                    self.titleLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }, completion: { _ in
                    UIView.animate(withDuration: duration, animations: {
                        self.titleLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    }, completion: { _ in
                        completion()
                    } )
                })
            })
        })
    }
    
    func goTo(){
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}

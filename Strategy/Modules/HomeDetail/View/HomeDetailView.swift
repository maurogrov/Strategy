//
//  HomeDetailView.swift
//  StrategyApp
//
//  Created by Mauricio Guerrero on 09/06/23.
//

import UIKit

class HomeDetailView: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    var dataList: [DetailViewModel] = []
    
    deinit{
        print("deinit \(String(describing: type(of: self))) no memoryLeaks")
    }
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 210
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        configLayout()
        presenter.loadData()
    }
    
    func configLayout() {
        self.title = StrategyStrings.subtitleDetailHome.rawValue
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}

extension HomeDetailView: DetailPresenterViewProtocol {
    func receiveData(model: [DetailViewModel]) {
        for element in model {
            dataList.append(element)
            let indexPath = IndexPath(row: dataList.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .left)
        }
    }
}

extension HomeDetailView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        let model = dataList[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

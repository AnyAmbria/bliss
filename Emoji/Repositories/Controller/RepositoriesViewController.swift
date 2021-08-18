//
//  RepositoriesViewController.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class RepositoriesViewController: BaseViewController {
    
    var viewModel: RepositoriesViewModel
    let repositoriesView = RepositoriesView()
    let errorView = ErrorView()
    
    init(viewModel: RepositoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoriesView.tableView.delegate = self
        repositoriesView.tableView.dataSource = self
        configureNavigation(title: "Apple Repos")
        viewModel.getRepo()
        bindElements()
    }
    
    func bindElements() {
        viewModel.errorList.bind(skip: true) { error in
            if error {
                self.handleError(errorView: self.errorView)
            } else {
                self.handleSuccess(successView: self.repositoriesView)
                self.repositoriesView.tableView.reloadData()
            }
        }
    }
}

extension RepositoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = viewModel.repos?[indexPath.row].fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

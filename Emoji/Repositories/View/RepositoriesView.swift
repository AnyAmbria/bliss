//
//  RepositoriesView.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class RepositoriesView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .blue
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        self.backgroundColor = .blue
        self.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

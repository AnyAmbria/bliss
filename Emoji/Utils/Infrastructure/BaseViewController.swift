//
//  BaseViewController.swift
//  Emoji
//
//  Created by Any Ambria on 17/08/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    func configureNavigation(title: String) {
        configureNavTitle(title)
        configureBackButton()
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func hiddenNavagation() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureNavTitle(_ title: String) {
        self.title = title
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
    }
    
    private func configureBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.tintColor = UIColor.blue
    }
    
    func handleError(errorView: UIView) {
        errorView.removeFromSuperview()
        view.addSubview(errorView)
        setConstraint(view: errorView)
    }
    
    func handleSuccess(successView: UIView) {
        successView.removeFromSuperview()
        view.addSubview(successView)
        setConstraint(view: successView)
    }
    
    private func setConstraint(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
}

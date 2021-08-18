//
//  HomeViewController.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    var viewModel: HomeViewModel
    let homeView = HomeView()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        homeView.delegate = self
        bindElements()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hiddenNavagation()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func bindElements() {
        viewModel.errorList.bind(skip: true, { [weak self] (errored) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if errored {
                    self.homeView.imageView.image = UIImage(named: "picture")
                } else {
                    self.homeView.imageView.downloaded(from: self.viewModel.randomEmoji ?? "")
                }
            }
        })
        
        viewModel.errorAvatar.bind(skip: true, { [weak self] (errored) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if errored {
                    self.homeView.imageView.image = UIImage(named: "picture")
                } else {
                    self.homeView.imageView.downloaded(from: self.viewModel.avatarURL ?? "")
                }
            }
        })
    }
}

extension HomeViewController: HomeViewDelegate {
    func searchPressed() {
        viewModel.getAvatar(username: homeView.searchTextField.text ?? "")
        self.view.endEditing(true)
    }
    
    func emojisListPressed() {
        self.viewModel.showEmojisList()
    }
    
    func avatarsListPressed() {
        self.viewModel.showAvatars()
    }
    
    func appleReposPressed() {
        self.viewModel.showRepositories()
    }
    
    func randomEmojiPressed() {
        viewModel.getEmojis()
    }
}

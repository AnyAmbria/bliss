//
//  MainCoordinator.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import UIKit

class MainCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = HomeViewModel(coordinator: self)
        let vc = HomeViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showEmojisList(emojisList: [String], emojisDB: [Emojis]) {
        let vm = EmojisListViewModel(coordinator: self, emojisList: emojisList, emojisDB: emojisDB)
        let vc = EmojisListViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAvatarsList() {
        let vm = AvatarsListViewModel(coordinator: self)
        let vc = AvatarsListViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showRepositories() {
        let vm = RepositoriesViewModel(coordinator: self)
        let vc = RepositoriesViewController(viewModel: vm)
        navigationController.pushViewController(vc, animated: true)
    }
}


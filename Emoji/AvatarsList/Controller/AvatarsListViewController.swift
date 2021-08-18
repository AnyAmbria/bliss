//
//  AvatarsListViewController.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class AvatarsListViewController: BaseViewController {
    
    var viewModel: AvatarsListViewModel
    let avatarsListView = AvatarsListView()
    let emptyView = ErrorView()
    
    init(viewModel: AvatarsListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = avatarsListView
        avatarsListView.collectionView.delegate = self
        avatarsListView.collectionView.dataSource = self
        configureNavigation(title: "Avatars List")
        bindElements()
        viewModel.getAvatars()
    }
    
    func bindElements() {
        viewModel.avatars.bind(skip: true) { avatar in
            if avatar.isEmpty {
                self.emptyView.titleLabel.text = "Empty"
                self.emptyView.imageView.image = UIImage(named: "empty")
                self.handleError(errorView: self.emptyView)
            } else {
                self.avatarsListView.collectionView.reloadData()
            }
        }
    }
}

extension AvatarsListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.avatars.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojisViewCell.reuseId, for: indexPath) as? EmojisViewCell ?? EmojisViewCell()
        let avatars = viewModel.avatars.value
        cell.imageView.image = UIImage(data: avatars[indexPath.item].avatarURL ?? Data())
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let avatar = viewModel.avatars.value[indexPath.item]
        viewModel.deleteAvatar(avatar: avatar)
    }
}

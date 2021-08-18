//
//  EmojisListViewController.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import UIKit

class EmojisListViewController: BaseViewController {
    
    var viewModel: EmojisListViewModel
    var emojisListView = EmojisListView()
    let errorView = ErrorView()
    
    init(viewModel: EmojisListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojisListView.collectionView.delegate = self
        emojisListView.collectionView.dataSource = self
        configureNavigation(title: "Emojis List")
        viewModel.getEmojis()
        bindElements()
    }
    
    func bindElements() {
        viewModel.errorList.bind(skip: true) { error in
            if error {
                self.handleError(errorView: self.errorView)
            } else {
                self.handleSuccess(successView: self.emojisListView)
                self.emojisListView.collectionView.reloadData()
            }
        }
    }
    
}

extension EmojisListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.shouldFetch ? viewModel.emojisList.count : viewModel.emojisDB.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmojisViewCell.reuseId, for: indexPath) as? EmojisViewCell  ?? EmojisViewCell()
        if viewModel.shouldFetch{
            let emoji = viewModel.emojisList[indexPath.item]
            
            cell.imageView.downloaded(from: emoji)
            self.viewModel.saveEmoji(imageData: emoji as? Data)
        } else {
            let imgData = viewModel.emojisDB[indexPath.item].url ?? Data()
            cell.imageView.image = UIImage(data: imgData)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.performBatchUpdates({
            if viewModel.shouldFetch{
                viewModel.emojisList.remove(at: indexPath.item)
            } else {
                viewModel.emojisDB.remove(at: indexPath.item)
            }
            collectionView.deleteItems(at: [indexPath])
        }, completion: nil)
    }
}

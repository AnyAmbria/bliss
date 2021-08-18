//
//  EmojisListViewModel.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import Moya

class EmojisListViewModel {
    
    var coordinator: MainCoordinator
    var provider = MoyaProvider<Service>()
    var emojisList = [String]()
    var emojisDB = [Emojis]()
    var errorList = Bindable<Bool>(false)
    
    var shouldFetch: Bool {
        emojisDB.isEmpty
    }
    
    init(coordinator: MainCoordinator, emojisList: [String], emojisDB: [Emojis]) {
        self.coordinator = coordinator
        self.emojisList = emojisList
        self.emojisDB = emojisDB
    }
    
    func getEmojis() {
        provider.request(.emojis) { result in
            switch result {
            case let .success(response):
                if let success = try? JSONSerialization.jsonObject(with: response.data, options: []) as? [String: String], !success.isEmpty {
                    self.emojisList = Array(success.values.map{ $0 })
                    self.errorList.value = false
                } else {
                    self.errorList.value = true
                }
                
            case .failure(_):
                self.errorList.value = true
            }
        }
    }
    
    func saveEmoji(imageData: Data?) {
        guard let data = imageData else { return }
        CoreDataManager.shared.saveEmoji(data: data)
    }
    
    func refreshData() {
        emojisDB = CoreDataManager.shared.fetchEmoji()
    }
}

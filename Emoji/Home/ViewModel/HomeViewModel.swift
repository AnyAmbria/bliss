//
//  HomeViewModel.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import Moya

class HomeViewModel {
    
    let coreData = CoreDataManager.shared
    var coordinator: MainCoordinator
    var provider = MoyaProvider<Service>()
    var errorList = Bindable<Bool>(false)
    var errorAvatar = Bindable<Bool>(false)
    var avatarURL: String?
    private var emojisList = [String]()
    private var emojisDB = [Emojis]()
    var randomEmoji :String?
    var randomDBEmoji :Data?
    
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func showEmojisList() {
        coordinator.showEmojisList(emojisList: emojisList, emojisDB: emojisDB)
    }
    
    func showAvatars() {
        coordinator.showAvatarsList()
    }
    
    func showRepositories() {
        coordinator.showRepositories()
    }
    
    func getEmojis() {
        emojisDB = coreData.fetchEmoji()
        if emojisDB.isEmpty {
            provider.request(.emojis) { result in
                switch result {
                case let .success(response):
                    if let success = try? JSONSerialization.jsonObject(with: response.data, options: []) as? [String: String], !success.isEmpty {
                        self.randomEmoji = success.randomElement()?.value
                        
                        self.emojisList = Array(success.values.map{ $0 })
                        self.errorList.value = false
                    } else {
                        self.errorList.value = true
                    }
                    
                case .failure(_):
                    self.errorList.value = true
                }
            }
        } else {
            self.randomDBEmoji = emojisDB.randomElement()?.url
            self.errorList.value = false
        }
        
    }
    
    func getAvatar(username: String) {
        provider.request(.users(username: username)) { result in
            switch result {
            case let .success(response):
                if let success = try? JSONDecoder().decode(Avatars.self, from: response.data) {
                    self.avatarURL = success.avatarURL
                    self.saveAvatar(success)
                    self.errorAvatar.value = false
                } else {
                    self.errorAvatar.value = true
                }
                
            case .failure(_):
                self.errorAvatar.value = true
            }
        }
    }
    
    func saveAvatar(_ avatar: Avatars) {
        coreData.saveAvatar(avatar: avatar)
    }
}

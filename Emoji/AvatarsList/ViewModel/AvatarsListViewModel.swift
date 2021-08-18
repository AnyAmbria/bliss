//
//  AvatarsListViewModel.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation

class AvatarsListViewModel {
    
    var coordinator: MainCoordinator
    let avatars = Bindable<[Avatar]>([])
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getAvatars() {
        avatars.value = CoreDataManager.shared.fetchAvatar()
    }
    
    func deleteAvatar(avatar: Avatar) {
        CoreDataManager.shared.deleteAvatar(avatar: avatar) {
            getAvatars()
        }
    }
}

//
//  RepositoriesViewModel.swift
//  Emoji
//
//  Created by Any Ambria on 15/08/21.
//

import Foundation
import Moya

class RepositoriesViewModel {
    
    var coordinator: MainCoordinator
    var provider = MoyaProvider<Service>()
    var repos: [Repo]?
    var errorList = Bindable<Bool>(false)
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func getRepo() {
        provider.request(.repo) { result in
            switch result {
            case let .success(response):
                if let success = try? JSONDecoder().decode([Repo].self, from: response.data), !success.isEmpty {
                    self.repos = success
                    self.errorList.value = false
                } else {
                    self.errorList.value = false
                }
                
            case let .failure(error):
                print(error)
            }
        }
    }
}

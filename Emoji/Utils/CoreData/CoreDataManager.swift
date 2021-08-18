//
//  CoreDataManager.swift
//  Emoji
//
//  Created by Any Ambria on 17/08/21.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    func saveEmoji(data: Data) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Emojis", in: managedContext)!
        let emojiImage = Emojis(entity: userEntity, insertInto: managedContext)
        emojiImage.url = data
        
        do {
            try managedContext.save()
            debugPrint("Emojis Image saved")
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func fetchEmoji() -> [Emojis] {
        var emojis = [Emojis]()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return emojis }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Emojis")

        do {
            emojis = try (managedContext.fetch(fetchRequest) as? [Emojis] ?? [Emojis()])
        } catch {
            debugPrint("Error while fetching the image")
        }
        return emojis
    }
    
    func saveAvatar(avatar: Avatars) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Avatar", in: managedContext)!
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
        fetchRequest.entity = userEntity
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "login == %@", avatar.login ?? "")
        
        var count = 0
        do {
            count = try managedContext.count(for: fetchRequest)
        } catch {
            debugPrint(error.localizedDescription)
        }
        guard count == 0 else { return }
        
        let avatarDB = Avatar(entity: userEntity, insertInto: managedContext)
        
        let url = URL(string: avatar.avatarURL ?? "")
        if let data = try? Data(contentsOf: url!)
        {
            let pngData: Data = UIImage(data: data)?.pngData() ?? Data()
            avatarDB.avatarURL = pngData
        }
        avatarDB.login = avatar.login

        do {
            try managedContext.save()
            debugPrint("Avatar saved")
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func fetchAvatar() -> [Avatar] {
        var avatars = [Avatar]()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return avatars }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Avatar")
        
        do {
            avatars = try (managedContext.fetch(fetchRequest) as? [Avatar] ?? [Avatar()])
        } catch {
            debugPrint("Error while fetching the image")
        }
        
        return avatars
    }
    
    func deleteAvatar(avatar: Avatar, completion: () -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        managedContext.delete(avatar)
        
        do {
            try managedContext.save()
            completion()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

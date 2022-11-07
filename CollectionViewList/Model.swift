//
//  Model.swift
//  CollectionViewList
//
//  Created by Максим Боталов on 07.11.2022.
//

import Foundation


// MARK: - Перечисление секции
enum Section {
    case main
}

// MARK: - Модель юзера
struct User: Codable {
    var title: String
    
    static func getData() -> [User] {
        var users = [User]()
        
        users.append(User(title: "Max"))
        users.append(User(title: "Irina"))
        users.append(User(title: "Dima"))
        users.append(User(title: "Andrey"))
        
        return users
    }
}

// MARK: - Расширение модели юзера с подписью на протокол "Hashable"
extension User: Hashable {}

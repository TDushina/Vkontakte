//
//  User.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 21.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class User: Decodable {
    dynamic var nameUser: String
    dynamic var avatarUrl: String
    dynamic var photoUrl: Photo?
    
    // MARK: - Decodable
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarUrl = "photo_50"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        self.nameUser = firstName + " " + lastName
        
        self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    }

}

// MARK: - FAKE
struct UserFake: Equatable {
    var nameUser: String
    var avatar: UIImage?
    var photoUser: [UIImage?]
    
    static var users: [UserFake] = [
        UserFake(nameUser: "Иван Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo6")]),
        UserFake(nameUser: "Пётр Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4")]),
        UserFake(nameUser: "Анна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Ольга Петрова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Алёна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Настя Смирнова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Анна Кузнецова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Елена Соколова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Марина Морозова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Надежда Алексеева",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Нина Семёнова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Светлана Козлова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Юлия Николаева",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Татьяна Степанова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        UserFake(nameUser: "Алексей Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Артём Смирнов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Владимир Попов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Вадим Кузнецов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Данил Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Денис Соколов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Дмитрий Михайлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Егор Новиков",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Кирилл Фёдоров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Леонид Морозов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Максим Волков",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Матвей Алексеев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Никита Лебедев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Олег Семёнов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Павел Егоров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Роман Козлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Пётр Павлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Сергей Степанов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        UserFake(nameUser: "Станислав Николаев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")])
    ]
}



//
//  User.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 21.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

struct User: Equatable {
    var nameUser: String
    var avatar: UIImage?
    var photoUser: [UIImage?]
    
    static var users: [User] = [
        User(nameUser: "Иван Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo6")]),
        User(nameUser: "Пётр Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4")]),
        User(nameUser: "Анна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Ольга Петрова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Алёна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Настя Смирнова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Анна Кузнецова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Елена Соколова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Марина Морозова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Надежда Алексеева",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Нина Семёнова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Светлана Козлова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Юлия Николаева",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Татьяна Степанова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")]),
        User(nameUser: "Алексей Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Артём Смирнов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Владимир Попов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Вадим Кузнецов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Данил Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Денис Соколов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Дмитрий Михайлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Егор Новиков",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Кирилл Фёдоров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Леонид Морозов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Максим Волков",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Матвей Алексеев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Никита Лебедев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Олег Семёнов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Павел Егоров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Роман Козлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Пётр Павлов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Сергей Степанов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Станислав Николаев",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")])
    ]
}



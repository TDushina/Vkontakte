//
//  News.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 06.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

struct News: Equatable {
    var nameUser: String
    var avatar: UIImage?
    var photoUser: [UIImage?]
    var text: String
    var postDate: String
    
    static var news: [News] = [
        News(nameUser: "Иван Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Пётр Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Анна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Ольга Петрова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Алёна Иванова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Настя Смирнова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Анна Кузнецова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
                 postDate: "01.01.2020"),
        News(nameUser: "Елена Соколова",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo6")],
             text: Lorem.sentences(Int.random(in: 3...7)),
                 postDate: "01.01.2020"),
        News(nameUser: "Алексей Иванов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Артём Смирнов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Владимир Попов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Вадим Кузнецов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Данил Петров",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020"),
        News(nameUser: "Денис Соколов",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo4"),
                UIImage(named: "photo5"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")],
             text: Lorem.sentences(Int.random(in: 3...7)),
             postDate: "01.01.2020")
    ]
}

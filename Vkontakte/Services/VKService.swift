//
//  VKService.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 26.09.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit
import Alamofire

class VKService {
    
    let session = Session.instance
    let baseUrl = "https://api.vk.com/method/"
    
    func getFriends(callback: @escaping ([User]) -> Void) {
        let path = "friends.get"
        let parameters: Parameters = [
            "fields": "photo_50",
            "order": "name",
            "access_token": "\(session.token ?? "No token")",
            "v": "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get, parameters: parameters).responseData { response in
            guard let data = response.value else { return }
//            debugPrint(data)
            
            do {
                let friends = try JSONDecoder().decode(VKResponse<User>.self, from: data).items
                callback(friends)
                debugPrint(friends)
            } catch {
                debugPrint(error)
            }
        }
    }

    func getPhotos(id: String, callback: @escaping ([Photo]) -> Void) {
        
        let path = "photos.getAll"
        let parameters: Parameters = [
            "owner_id": "\(String(describing: session.userId))",
            "access_token": "\(session.token ?? "No token")",
            "v":          "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get ,parameters: parameters).responseData { (response) in
            guard let data = response.value else { return }
            debugPrint(data)
            
            do {
                let photos = try JSONDecoder().decode(VKResponse<Photo>.self, from: data).items
                callback(photos)
                debugPrint(photos)
            } catch {
                debugPrint(error)
            }

        }
    }
    
    func getGroups(callback: @escaping ([Group]) -> Void) {
        let path = "groups.get"
        let parameters: Parameters = [
            "extended": 1,
            "access_token": "\(session.token ?? "No token")",
            "v": "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, method: .get , parameters: parameters).responseData { (response) in
            guard let data = response.value else { return }
//            debugPrint(data)
            
            do {
                let allGroups = try JSONDecoder().decode(VKResponse<Group>.self, from: data).items
                callback(allGroups)
                debugPrint(allGroups)
            } catch {
                debugPrint(error)
            }
        }
    }
    
    func groupsSearch() {
        let path = "groups.search"
        let parameters: Parameters = [
            "q":            "music",
            "access_token": "\(session.token ?? "No token")",
            "v":          "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, parameters: parameters).responseJSON { (response) in
            debugPrint(response.value ?? "No JSON")
        }
        
    }
    
}

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
    
    func getFriends() {
        let path = "friends.get"
        let parameters: Parameters = [
            "access_token": "\(session.token ?? "No token")",
            "v":          "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, parameters: parameters).responseJSON { response in
            debugPrint(response.value ?? "No JSON")
        }
    }

    func getPhotos() {
        let path = "photos.getAll"
        let parameters: Parameters = [
            "access_token": "\(session.token ?? "No token")",
            "v":          "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, parameters: parameters).responseJSON { (response) in
            debugPrint(response.value ?? "No JSON")
        }
    }
    
    func getGroups() {
        let path = "groups.get"
        let parameters: Parameters = [
            "access_token": "\(session.token ?? "No token")",
            "v":          "5.124"
        ]
        
        let url = baseUrl + path
        
        AF.request(url, parameters: parameters).responseJSON { (response) in
            debugPrint(response.value ?? "No JSON")
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

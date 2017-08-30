//
//  Event.swift
//  G-group
//
//  Created by Евгений Богачев on 21.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class Event: Mappable {
    var postId: UInt64!
    var eventTitle: String!
    var eventPhotoURL: String!
    var eventPhotoId: UInt64!
    
    
    init(postId: UInt64 = 99999,
        eventTitle: String = "EmptyEvent",
        eventURL: String = "nope",
        eventPhotoId: UInt64 = 99999) {
    
        self.eventTitle = eventTitle
        self.eventPhotoURL = eventURL
        self.postId = postId
        self.eventPhotoId = eventPhotoId
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        eventTitle <- map["rendered"]
        eventPhotoURL <- map["source_url"]
    }
    
    func getPostId() -> UInt64 {
        return postId
    }
    
    func setPostId(newPostId: UInt64) {
        postId = newPostId
    }
    
    func getEventPhotoId() -> UInt64 {
        return eventPhotoId
    }
    
    func setEventPhotoId(newEventPhotoId: UInt64) {
        eventPhotoId = newEventPhotoId
    }
    
    func setEventTitle(newEventTitle: String) {
        self.eventTitle = newEventTitle
    }
    
    func getEventTitle() -> String {
        return eventTitle
    }
    
    func setEventURL(newEventURL: String) {
        self.eventPhotoURL = newEventURL
    }
    
    func getEventURL() -> URL {
        let encoded = self.eventPhotoURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let url = URL(string: encoded!)
        //let url = URL(string: self.eventPhotoURL)
        return url!
    }
}

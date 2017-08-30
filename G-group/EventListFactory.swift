//
//  EventListBuilder.swift
//  G-group
//
//  Created by Евгений Богачев on 22.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation

class EventListFactory {
    
    static func constructEventList(eventIdTitleList: NSDictionary, eventPhotoURLList: Dictionary<UInt64, String>) -> EventList {
        var eventList = EventList(list: [Event()])
        
        
        for postId in eventIdTitleList.allKeys  {
            let id = (postId as! UInt64)
            let event = Event()
            event.setPostId(newPostId: id)
          
        }
        
        return eventList
    }
}

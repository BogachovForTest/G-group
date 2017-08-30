//
//  EventList.swift
//  G-group
//
//  Created by Евгений Богачев on 22.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
class EventList {
    var list: [Event]!
    
    init(list: [Event]) {
        self.list = list
    }
    
    func setEventList(list: [Event]) -> Void {
        self.list = list
    }
    
    func getEventList() -> [Event] {
        return list
    }
    
    func addEvent(newEvent: Event) -> Void {
        if (list[0].getEventTitle() == "EmptyEvent"){
            list[0] = newEvent
        } else {
          list.append(newEvent)
        }
    }
    
    func getEventMediaList() -> Array<UInt64> {
        var mediaList: Array<UInt64> = Array<UInt64>()
        for event in list {
           mediaList.append(event.getEventPhotoId())
        }
    
        return mediaList
    }
}

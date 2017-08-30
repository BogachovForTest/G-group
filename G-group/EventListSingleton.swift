//
//  Akcii.swift
//  G-group
//
//  Created by Евгений Богачев on 08.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import UIKit
final class EventListSingleton {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = EventListSingleton()
    
    // MARK: Local Variable
    
    var eventList  = EventList(list: [Event()])
    
//    func addEventImage(newPhoto: UIImage) {
//        self.eventArray.append(newPhoto)
//    }
    
    func setEventList(newEventList: EventList) {
        self.eventList = newEventList
    }
    
    func getEventList() -> EventList {
        return eventList
    }
    
}

//
//  FromWebSiteRepository.swift
//  G-group
//
//  Created by Евгений Богачев on 20.06.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import PromiseKit

class WebSiteRepository {
    
    static func getEventInfoList() -> Promise<EventList> {
        return Promise { fulfill, reject in
            let eventList: EventList = EventList(list: [Event()])
            let URL = "http://g-group.com.ua/wp-json/wp/v2/posts"
            Alamofire.request(URL).responseJSON { (response) in
                let postArray = response.result.value as! NSArray
                for post in postArray {
                    let event: Event = Event();
                    event.setPostId(newPostId: (post as! NSDictionary).value(forKey: "id") as! UInt64)
                    event.setEventTitle(newEventTitle: ((post as! NSDictionary).value(forKey: "title") as! NSDictionary!).value(forKey: "rendered") as! String)
                    event.setEventPhotoId(newEventPhotoId: (post as! NSDictionary).value(forKey: "featured_media") as! UInt64)
                    eventList.addEvent(newEvent: event)
                }
                if (!eventList.getEventList().isEmpty){
                 fulfill(eventList)
                } else {
                    reject("idList is empty" as! Error)
                }
            }
        }
    }
    
    static func  getCurrentStoreEventInfoList(storeId: Int) -> Promise<EventList> {
        return Promise { fulfill, reject in
            let eventList: EventList = EventList(list: [Event()])
            let URL = "http://g-group.com.ua/wp-json/wp/v2/posts"
            Alamofire.request(URL, method: .get, parameters: ["categories" : [storeId]]).responseJSON { (response) in
                
                let postArray = response.result.value as! NSArray
                for post in postArray {
                    let event: Event = Event();
                    event.setPostId(newPostId: (post as! NSDictionary).value(forKey: "id") as! UInt64)
                    event.setEventTitle(newEventTitle: ((post as! NSDictionary).value(forKey: "title") as! NSDictionary!).value(forKey: "rendered") as! String)
                    event.setEventPhotoId(newEventPhotoId: (post as! NSDictionary).value(forKey: "featured_media") as! UInt64)
                    eventList.addEvent(newEvent: event)
                }
                if (!eventList.getEventList().isEmpty){
                    fulfill(eventList)
                } else {
                    reject("idList is empty" as! Error)
                }
            }
        }
    }
    
    static func addPhotoUrlToEventList(eventList: EventList) -> Promise<EventList> {
        return Promise {fulfill, reject in
            let mediaUrlList = eventList.getEventMediaList()
            let URL =  "http://g-group.com.ua/wp-json/wp/v2/media/"
            Alamofire.request(URL, method: .get, parameters: ["include" : mediaUrlList])
                .responseJSON { (response) in
                    let mediaArray = response.result.value as! NSArray
                    for media in mediaArray {
                        let postMedia = media as! NSDictionary
                        for event in eventList.getEventList() {
                            if (event.getPostId() == postMedia.value(forKey: "post") as! UInt64){
                                event.setEventURL(newEventURL: postMedia.value(forKey: "source_url") as! String)
                                
                            }
                        }
                    }
                    fulfill(eventList)
            }
    }
}

    static func getEventList() -> Promise<EventList> {
        return Promise<EventList> {fulfill, reject in
            getEventInfoList()
            .then{ (eventList) in
                    return addPhotoUrlToEventList(eventList: eventList)
            }
            .then{ (eventList) in
                    fulfill(eventList)
            }
        }
    }
    
    static func getCurrentStoreEventLsit(storeId: Int) -> Promise<EventList> {
        return Promise<EventList> {fulfill, reject in
            getCurrentStoreEventInfoList(storeId: storeId)
                .then{ (eventList) in
                    return addPhotoUrlToEventList(eventList: eventList)
                }
                .then{ (eventList) in
                    fulfill(eventList)
            }
        }
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = NSURL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
//    static func getImageListFromUrl(urlList: Array<String>) -> Promise<Array<UIImage>> {
//        return Promise<Array<UIImage>> {fulfill, reject in
//            var imageList: Array<UIImage> = Array()
//            if let filePath = Bundle.main.path(forResource: "imageName", ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//                imageList.append(image)
//            }
//            
//        }
//    }
}

//
//  Order.swift
//  G-group
//
//  Created by Евгений Богачев on 01.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import ObjectMapper

class Order: Mappable {
    var userName: String!
    var userPhone: String!
    var noCall: Int!
    var noSms: Int!
    var peopleCount: Int!
    var comment: String!
    var payType: String!
    var time: String!
    
    init(
        userName: String = "nope",
        userPhone: String = "nope",
        noCall: Int = 0,
        noSms: Int = 0,
        peopleCount: Int = 0,
        comment: String = "nope",
        payType: String = "card",
        time: String = "nope"
        ) {
        self.userName = userName
        self.userPhone = userPhone
        self.noCall = noCall
        self.noSms = noSms
        self.peopleCount = peopleCount
        self.comment = comment
        self.payType = payType
        self.time = time
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    func setUserName(newUserName: String) {
        self.userName = newUserName
    }
    
    func getUserName() -> String {
        return userName
    }
    
    func setUserPhone(newUserPhone: String) {
        self.userPhone = newUserPhone
    }
    
    func getUserPhone() -> String {
        return userPhone
    }

    func setNoCall(state: Int) {
        self.noCall = state
    }
    
    func getNoCall() -> Int {
        return noCall
    }
    
    func setNoSms(state: Int) {
        self.noSms = state
    }
    
    func getNoSms() -> Int {
        return noSms
    }
    
    func setPeopleCount(newCount: Int) {
        self.peopleCount = newCount
    }
    
    func getPeopleCount() -> Int {
        return peopleCount
    }
    
    func setComment(newComment: String) {
        self.comment = newComment
    }
    
    func getComment() -> String {
        return comment
    }
    
    func getPayType() -> String {
        return payType
    }
    
    func setPayType(newPayType: String) {
        self.payType = newPayType
    }
    
    func setTime(newTime: String ) {
         self.time = newTime
    }
    
    func getTime() -> String {
        return self.time
    }


    
    
    

    
    

        
    
}

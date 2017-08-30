//
//  ReadyRequestMapper.swift
//  G-group
//
//  Created by Евгений Богачев on 11.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import Alamofire


class ReadyRequestMapper {
    static func map(order: Order, cartList: [Cart], adress: String) -> Parameters{
        var cartParametr: [Parameters] = []
        let orderParametr: NSDictionary = [
            "userName" : order.getUserName(),
            "userPhone" : order.getUserPhone(),
            "noCall" : order.getNoCall(),
            "noSms" : order.getNoSms(),
            "peopleCount" : order.getPeopleCount(),
            "comment" : order.getComment(),
            "payType" : order.getPayType(),
            "time" : order.getTime()
        ]
        
        for cart in cartList{
            let dict = [
                "id" : cart.getId(),
                "count" : cart.getCount()
            ] 
            cartParametr.append(dict as Parameters)
        }
        
        let result: Parameters = [
            "Cart" : cartParametr,
            "Order" : orderParametr,
            "address" : adress
        ]
        
        return result
    }
}

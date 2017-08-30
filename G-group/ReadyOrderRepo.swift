//
//  ReadyOrderRepo.swift
//  G-group
//
//  Created by Евгений Богачев on 11.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class ReadyOrderRepo {
    var order: Order!
    var cartList: [Cart]!
    var adress: String
    var orderForRequest: Parameters!
    
    static let shared = ReadyOrderRepo()
    
    private init(
        order: Order = Order(),
        cartList: [Cart] = [Cart()],
        adress: String = "nope"
        )
    {
        self.order = order
        self.cartList = cartList
        self.adress = adress
    }
    
    func mapForRequset() {
        self.orderForRequest = ReadyRequestMapper.map(
            order: order,
            cartList: cartList,
            adress: adress
        )
    }
    
    func sendRequest() -> Promise<String> {
        return Promise<String>{ fullfil, reject in
            OrderRes.sendOrder(parameters: orderForRequest)
                .then{ result  in
                    fullfil(result)
            }
        }
    }
    
    func setCardList(newCartList: [Cart]) {
        self.cartList = newCartList
    }
    
    func getCardList() -> [Cart] {
        return cartList
    }
    
    func setOrder(newOrder: Order) {
        self.order = newOrder
    }
    
    func getOrder() -> Order {
        return self.order
    }
    
    func setAdress(newAdress: String) {
        self.adress = newAdress
    }
    
    func getAdress() -> String{
        return self.adress
    }
}

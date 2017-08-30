//
//  CartListMapper.swift
//  G-group
//
//  Created by Евгений Богачев on 05.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
class CartListMapper {
    static func map(cartList: [Cart], services: [String]) -> [Any]{
        var rightList: [Any] = []
        for service in services {
            for store in StoreList.shared.getStoreList() {
                if (store.storeName == service){
                   rightList.append(store.getDefultImage())
                }
            }
            
            for cart in cartList {
                if (service == cart.getStore()){
                    rightList.append(cart)
                }
                
            }
        }
       return rightList
    }
}

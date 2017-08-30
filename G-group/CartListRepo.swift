import Foundation
import UIKit
final class CartListRepo {
    
    private init() { }
    
    static let shared = CartListRepo()
    
    var cartList: [Cart]! 
    var services: [String]!
    
    func setServices(newServices: [String]) {
        self.services = newServices
    }
    
    func getServices() -> [String] {
        return self.services
    }
    
    
    func setCartList(newCartList: [Cart]) {
        self.cartList = newCartList
    }
    
    func getCartList() -> [Cart] {
        return cartList
    }
    
    func addCart(newCart: Cart, store: String) {
        if (cartList == nil) {
            cartList = [newCart]
            if (!isServiceExist(store: store)){
                addService(newService: store)
            }
        } else {
            if (!isServiceExist(store: store)){
                addService(newService: store)
            }
            
            if (isCartExist(newCart: newCart).0){
                cartList[isCartExist(newCart: newCart).1].pluseCount()
            } else {
                cartList.append(newCart)
            }
        }
    }
    
    func addCount(cartId: Int){
        let cartIndex = findCartById(id: cartId)
        cartList[cartIndex].setCount(newCount: cartList[cartIndex].getCount() + 1)
    }
    
    func lessCount(cartId: Int) {
        let cartIndex = findCartById(id: cartId)
        if (cartList[cartIndex].getCount() > 1){
            cartList[cartIndex].setCount(newCount: cartList[cartIndex].getCount() - 1)
        } else {
            removeCart(index: cartIndex)
        }
    }
    
    func mapToAdapter() -> [Any] {
        if (self.cartList == nil ){
            return []
        } else {
            return CartListMapper.map(cartList: self.cartList, services: self.services)
        }
    }
    
    func isServiceExist(store: String) -> Bool {
        if (services == nil) {
            return false
        } else {
            return services.contains(store)
        }
    }
    
    func isServiceStillExist(store: String) -> Bool {
        if (cartList.count != 0){
            for i in 0...cartList.count - 1 {
                if (cartList[i].getStore() == store) {
                    return true
                }
            }
            return false
        }else {
            return false
        }
    }
    
    func addService(newService: String) {
        if (services == nil){
            services = [newService]
        } else {
            services.append(newService)
        }
    }
    
    func findCartById(id: Int) -> Int {
        for i in 0...cartList.count - 1 {
            if (cartList[i].getId() == id){
                return i
            }
        }
        return 00
    }
    
    func removeCart(index: Int) {
        let store = cartList[index].getStore()
        self.cartList.remove(at: index)
        if (cartList.count > 0 ){
            if (!isServiceStillExist(store: store)){
                removeService(store: store)
            }
        } else {
            services.removeAll()
        }
    }
    
    func removeService(store: String){
        let index = services.index(of: store)
        services.remove(at: index!)
    }
    
    func isCartExist(newCart: Cart) -> (Bool,Int) {
        var isExst = false
        if (cartList.count > 0) {
            for i in 0...cartList.count - 1 {
                if ( cartList[i].getId() == newCart.getId()){
                    isExst = true
                    return (isExst,i)
                }
            }
        }
        return (isExst, 00)
    }
    
}

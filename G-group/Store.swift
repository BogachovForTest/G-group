//
//  Store.swift
//  G-group
//
//  Created by Евгений Богачев on 10.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
class Store {
    var storeName: String
    var storeAdress: String
    var storeLikeCount: UInt64
    var storeDescription: String
    var storeUrl: String
    var storePhoto: UIImage
    var serchId: Int
    var gorillaId: Int
    var defultImage: UIImage
    
    
    init(storeName: String = "nope",
         storeAdress:String = "nope",
         storeLikeCount: UInt64 = 0,
         storeDescription: String = "nope",
         storeUrl: String = "nope",
         storePhoto: UIImage,
         serchId: Int = 0,
         gorillaId: Int = 0,
         defultImage: UIImage = #imageLiteral(resourceName: "photo-icon")
        ) {
        self.storeName = storeName
        self.storeAdress = storeAdress
        self.storeLikeCount = storeLikeCount
        self.storeDescription = storeDescription
        self.storeUrl = storeUrl
        self.storePhoto = storePhoto
        self.serchId = serchId
        self.gorillaId = gorillaId
        self.defultImage = defultImage
    }
    
    func getStoreName() -> String {
        return self.storeName
    }
    
    func setStoreName(newStoreName: String) {
        self.storeName = newStoreName
    }
    
    func getStoreAdress() -> String {
        return self.storeAdress
    }
    
    func setStoreAdress(newStoreAdress: String) {
        self.storeAdress = newStoreAdress
    }
    
    func getStoreDescription() -> String {
        return self.storeDescription
    }
    
    func setStoreDescription(newStoreDescription: String) {
        self.storeDescription = newStoreDescription
    }
    
    func getStoreUrl() -> URL {
        return URL(string: self.storeUrl)!
    }
    
    func setStoreUrl(newStoreUrl: String) {
        self.storeUrl = newStoreUrl
    }
    
    func setSerchId(newId: Int) {
        self.serchId = newId
    }
    
    func getSerchId() -> Int {
        return serchId
    }
    
    func getStoreLikeCount() -> UInt64 {
        return self.storeLikeCount
    }
    
    func setStoreLikeCount(newStoreLikeCount: UInt64) {
        self.storeLikeCount = newStoreLikeCount
    }
    
    func getStorePhoto() -> UIImage {
        return self.storePhoto
    }
    
    func setStorePhoto(newStorePhoto: UIImage) {
        self.storePhoto = newStorePhoto
    }
    
    func setGorillaId(newId: Int) {
        self.gorillaId = newId
    }
    
    func getGorillaId() -> Int {
        return self.gorillaId
    }
    
    func setDefultImage(newImage: UIImage) {
        self.defultImage = newImage
    }
    
    func getDefultImage() -> UIImage {
        return self.defultImage
    }
    
    
}


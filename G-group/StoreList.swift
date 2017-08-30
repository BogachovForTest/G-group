//
//  StoreList.swift
//  G-group
//
//  Created by Евгений Богачев on 10.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
final class StoreList {
    
    // Can't init is singleton
    private init() {createEventList()}
    
    // MARK: Shared Instance
    
    static let shared = StoreList()
    
    // MARK: Local Variable
    
    var storeList: [Store] = StoreFactory.createList()
    var searchIndex: Int! = 0
    
    func createEventList() {
        self.storeList = StoreFactory.createList()
    }
    
    func getStoreList() -> [Store] {
        return storeList
    }
    
    func getGorillaMenuList() -> [CurrentMenu] {
        var gorillaMenuList: [CurrentMenu] = []
        for store in self.storeList {
            if (store.getGorillaId() != 0){
                let newMenu: CurrentMenu = CurrentMenu(storeTitle: store.getStoreName(),
                                                       gorillaId: store.getGorillaId(),
                                                       defultImage: store.getDefultImage()
                                                       )
                gorillaMenuList.append(newMenu)
            }
        }
       return gorillaMenuList
    }
    
    func getNextStoreSerch(curent: Int) -> Int {
        var searchList: [Int] = []
        for store in storeList {
            if (!searchList.contains(store.getSerchId())){
                searchList.append(store.getSerchId())
            }
        }
        print(searchList)
        for i in 0...searchList.count-1{
            if(searchList[i] == curent){
                searchIndex = i
            }
        }
        if (searchIndex < searchList.endIndex - 1) {
        searchIndex = searchIndex + 1
        } else {
            searchIndex = 0
        }
        print(searchList[searchIndex])
        return searchList[searchIndex]
    }
    
    func getPreviusStoreSerch(curent: Int) -> Int {
        var searchList: [Int] = []
        for store in storeList {
            if (!searchList.contains(store.getSerchId())){
                searchList.append(store.getSerchId())
            }
        }
        for i in 0...searchList.count-1{
            if(searchList[i] == curent){
                searchIndex = i
            }
        }
        if (searchIndex == 0) {
            searchIndex = searchList.endIndex - 1
        } else {
            searchIndex = searchIndex - 1
        }
        return searchList[searchIndex]
    }
    
    
}

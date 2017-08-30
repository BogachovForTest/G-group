//
//  MenuUnitTests.swift
//  G-group
//
//  Created by Евгений Богачев on 28.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import XCTest
@testable import ggroup

class MenuUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //ItemTests
    
    func testShouldItemMapped() {
        let jsonString = "{\"id\": \"10250\",\"price\": \"65\",\"title\": \"Чизкейк Нью-Йорк\",\"categoryId\": \"20\",\"images\": {\"mobileList\": \"https://gorilla.com.ua/static/uploads/cache/x100/14882221452024526509.jpg\",\"desktopList\": \"https://gorilla.com.ua/static/uploads/cache/240x110/14882221452024526509.jpg\",\"desktopTablet\": \"https://gorilla.com.ua/static/uploads/cache/x400/14882221452024526509.jpg\",\"big\": \"https://gorilla.com.ua/static/uploads/items/14882221452024526509.jpg\"},\"weight\": \"180\",\"description\": \"\",\"extra\": false,\"types\": [],\"editLink\": null}"
        
        let tjson = "{\"images\": {\"mobileList\": \"https://gorilla.com.ua/static/uploads/cache/x100/14882221452024526509.jpg\",\"desktopList\": \"https://gorilla.com.ua/static/uploads/cache/240x110/14882221452024526509.jpg\"}}"
        
        let menuItem = MenuItem(JSONString: jsonString)
        assert(menuItem?.getImageUrl().absoluteString == "https://gorilla.com.ua/static/uploads/cache/x100/14882221452024526509.jpg")
        assert(menuItem?.id == 10250)
        assert(menuItem?.price == 65)
        assert(menuItem?.title == "Чизкейк Нью-Йорк")
        assert(menuItem?.categoryId == 20)
        assert(menuItem?.imageUrl == "https://gorilla.com.ua/static/uploads/cache/x100/14882221452024526509.jpg")
        assert(menuItem?.weight == 180)
        assert(menuItem?.description == "")
        
    }
    
    func testShouldSet() {
        let menuItem: MenuItem = MenuItem()
        menuItem.setId(newId: 11)
        menuItem.setPrice(newPrice: 22)
        menuItem.setTitle(newTitle: "ss")
        menuItem.setWeight(newWeight: 33)
        menuItem.setImageUrl(newImageUrl: "www:sd.com")
        menuItem.setCategoryId(newCategoryId: 44)
        menuItem.setDescription(newDescription: "dd")
        assert(menuItem.getId() == 11)
        assert(menuItem.getPrice() == 22)
        assert(menuItem.getTitle() == "ss")
        assert(menuItem.getWeight() == 33)
        assert(menuItem.getImageUrl() == URL(string: "www:sd.com"))
        assert(menuItem.getCategoryId() == 44)
        assert(menuItem.getDescription() == "dd")
        menuItem.weight = nil
        assert(menuItem.getWeight() == 0 )
    }
    
    //CategoryTests
    
    func testShouldCategoryMapped(){
        let jsonString = "{\"id\": \"1\",\"title\": \"Суши\",\"status\": \"0\",\"className\": \"sushi\",\"createdAt\": \"1462385538\",\"image\": \"14720439021346968023.jpg\"}"
        let categoty: MenuCategory = MenuCategory(JSONString: jsonString)!
        assert(categoty.getTitle() == "Суши")
        assert(categoty.getId() == 1)
    }
    
    func testShouldCategorySet() {
        let categoty: MenuCategory = MenuCategory()
        let item = MenuItem(id: 11, price: 22)
        categoty.setTitle(newTitle: "clearTitle")
        categoty.setId(newId: 33)
        categoty.setItemList(newItemList: [item])
        assert(categoty.getId() == 33)
        assert(categoty.getTitle() == "clearTitle")
        assert(categoty.getItemList()[0].getId() == 11)
        item.setTitle(newTitle: "newItem")
        categoty.addItemToList(newItem: item)
        assert(categoty.getItemList()[1].getTitle() == "newItem")
        
    }
    
    //CarrentMenuTests
    
    func testShouldCurrentMenuSet() {
        let currentMenu: CurrentMenu = CurrentMenu()
        currentMenu.setTitle(newTitle: "ss")
        currentMenu.setCategoryList(newCategoryList: [MenuCategory(id:4)])
        currentMenu.setGorillaId(newId: 22)
        currentMenu.setDefultImage(newImage: #imageLiteral(resourceName: "eleven_defult"))
        assert(currentMenu.getTitle() == "ss")
        assert(currentMenu.getCategoryList()[0].getId() == 4)
        assert(currentMenu.getGorillaId() == 22)
        assert(currentMenu.getDefultImage() == #imageLiteral(resourceName: "eleven_defult"))
        
    }
    
}

//
//  StoreFactory.swift
//  G-group
//
//  Created by Евгений Богачев on 10.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
class StoreFactory {
    
    static func createList() -> [Store] {
        var storeList: [Store] = []
        var store = Store(storeName: "Suluguni Cafe",
                          storeAdress: "Одесса, ул. Ак. Филатова 17",
                          storeLikeCount: 0,
                          storeDescription: "современный грузинский ресторан",
                          storeUrl: "http://g-group.com.ua/restaurants/suluguni-cafe/",
                          storePhoto: #imageLiteral(resourceName: "sulguni-cafe"),
                          serchId: 18
        )
        storeList.append(store);
        
        store = Store(storeName: "AL MEZZE",
                      storeAdress: "Одесса, ул. Екатерининская 10",
                      storeLikeCount: 0,
                      storeDescription: "Современная кухня Ближнего Востока, которая объединила в себе самые популярные блюда Ливана, Израиля и Марокко.",
                      storeUrl: "http://g-group.com.ua/restaurants/al-mezze/",
                      storePhoto: #imageLiteral(resourceName: "al-mezze"),
                      serchId: 1,
                      gorillaId: 120,
                      defultImage: #imageLiteral(resourceName: "almezze_defult")
        )
        storeList.append(store);
        
        store = Store(storeName: "Kinza",
                      storeAdress: "Одесса, ул Дерибасовская 31",
                      storeLikeCount: 0,
                      storeDescription: "Ресторан Kinza расположен в самом центре Одессы, в пешеходной зоне улицы Дерибасовская.\n\nKinza – это первый современный грузинский ресторан в Одессе.\n \n Меню состоит из традиционных грузинских закусок, салатов, супов, хинкали, хачапури, большого выбора мясных и рыбных блюд, а также десертов. Все мясные блюда нашего ресторана готовятся на открытом огне, а хачапури запекается в дровяной печи в самом центре ресторана на глазах у гостей. Широкий ассортимент блюд прийдется по вкусу как любителю мяса, так и вегетарианцам.\n \n В меню бара представлен широкий ассортимент грузинских вин различных производителей, традиционная грузинская чача, а также большой выбор грузинских лимонадов собственного приготовления. \n \n В летнее время работает терраса с видом на Городской Сад.",
                      storeUrl: "http://g-group.com.ua/restaurants/kinza/",
                      storePhoto: #imageLiteral(resourceName: "Kindza"),
                      serchId: 9,
                      gorillaId: 119,
                      defultImage: #imageLiteral(resourceName: "Kindza")
        )
        storeList.append(store);
        
        store = Store(storeName: "«Горячие Перцы» на Маршала Говорова",
                      storeAdress: "Одесса, Маршала Говорова 10/2",
                      storeLikeCount: 0,
                      storeDescription: "\"Горячие Перцы\" − это возможность окунутся в атмосферу американского пивного ресторана, в котором можно попробовать популярные блюда американской кухни. В меню также представлен большой выбор мясных блюд и разнообразных пивных закусок. \n \n Меню бара состоит из более чем 8 сортов разливного пива от лучших украинских и зарубежных пивных кампаний, а также крафтового пива украинских производителей. Коктейльная карта включает в себя американскую классику и оригинальные пивные коктейли. Для наших маленьких гостей предусмотрено детское меню. \n \n \"Горячие Перцы\" на Маршала Говорова самый большой ресторан в сети \"Горячие Перцы\", где вас ждут: два этажа, большая барная стойка, банкетный зал, детская комната, большой экран для просмотра спортивных событий. \n \n Мы всегда активны: мероприятия, живая музыка, DJ's, драйвовая атмосфера. \n\n Мясо, Пиво, Rock'n'Roll",
                      storeUrl: "http://g-group.com.ua/restaurants/goryachie-pertsy-na-marshala-govorova/",
                      storePhoto: #imageLiteral(resourceName: "perci-govorova"),
                      serchId: 6
                      
        )
        storeList.append(store);
        
        store = Store(storeName: "Горячие Перцы | Черноморск",
                      storeAdress: "Черноморск (Ильичёвск):Ул. Школьная, 17",
                      storeLikeCount: 0,
                      storeDescription: "\"Горячие Перцы\" − это возможность окунутся в атмосферу американского пивного ресторана, в котором можно попробовать популярные блюда американской кухни. В меню также представлен большой выбор мясных блюд и разнообразных пивных закусок. \n \n Меню бара состоит из более чем 8 сортов разливного пива от лучших украинских и зарубежных пивных кампаний, а также крафтового пива украинских производителей. Коктейльная карта включает в себя американскую классику и оригинальные пивные коктейли. Для наших маленьких гостей предусмотрено детское меню. \n \n \"Горячие Перцы\" в г. Черноморске расположены в парковой зоне. В летнее время работает большая терраса, которая окутана деревьями и зеленью. Также на ней есть детская площадка. \n \n Мы всегда активны: мероприятия, живая музыка, DJ's, драйвовая атмосфера. \n\n Мясо, Пиво, Rock'n'Roll",
                      storeUrl: "http://g-group.com.ua/restaurants/goryachie-pertsy-chernomorsk/",
                      storePhoto: #imageLiteral(resourceName: "prci-chernomorsk"),
                      serchId: 6
        )
        storeList.append(store);
        
        store = Store(storeName: "\"Горячие Перцы\" на Королева",
                      storeAdress: "Одесса, ул. Ак. Королева 60/1",
                      storeLikeCount: 0,
                      storeDescription: "\"Горячие Перцы\" − это возможность окунутся в атмосферу американского пивного ресторана, в котором можно попробовать популярные блюда американской кухни. В меню также представлен большой выбор мясных блюд и разнообразных пивных закусок. \n \n Меню бара состоит из более чем 8 сортов разливного пива от лучших украинских и зарубежных пивных кампаний, а также крафтового пива украинских производителей. Коктейльная карта включает в себя американскую классику и оригинальные пивные коктейли. Для наших маленьких гостей предусмотрено детское меню. \n \n Мы всегда активны: мероприятия, живая музыка, DJ's, драйвовая атмосфера. \n\n Мясо, Пиво, Rock'n'Roll",
                      storeUrl: "http://g-group.com.ua/restaurants/goryachie-pertsy/",
                      storePhoto: #imageLiteral(resourceName: "perci-coroleva"),
                      serchId: 6
                      
        )
        storeList.append(store);
        
        store = Store(storeName: "Eleven Dogs",
                      storeAdress: "Одесса, ул. Гаванная 11",
                      storeLikeCount: 0,
                      storeDescription: "Гастробар \"Eleven Dogs\" расположен в самом центре Одессы. Особенностью гастробара являются авторские хот-доги и коктейли. \n\n Меню \"Eleven Dogs\" состоит из 11 авторских хот-догов, каждый из которых приготовлен по уникальной рецептуре. Также в меню присутствуют закуски, салаты, супы и основные блюда. Разработкой меню занимался Бренд-Шеф сети Виктор Титов. Коктейльная карта включает себя как лучшую мировую классику, так и авторские коктейли от нашего Шеф-Бармена. \n\n По выходным играют DJ's, проходят вечеринки, а также иногда можно попасть на лекцию о барной культуре, либо на гостевой бартендинг. ",
                      storeUrl: "http://g-group.com.ua/restaurants/eleven-dogs/",
                      storePhoto: #imageLiteral(resourceName: "Eleven_Dogs"),
                      serchId: 7,
                      gorillaId: 121,
                      defultImage: #imageLiteral(resourceName: "eleven_defult")
        )
        storeList.append(store);
      return storeList
    }
    
}

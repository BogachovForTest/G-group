//
//  EventListViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 17.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import Kingfisher

class EventListViewController: UIViewController, UICollectionViewDelegate,
    UICollectionViewDataSource
 {
    @IBOutlet weak var eventListCollection: UICollectionView!
    @IBOutlet weak var storeTittleCollection: UILabel!
    var storeIndex: Int = StoreList.shared.getStoreList()[0].getSerchId()
    var currentStoreEventList: EventList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(StoreList.shared.getStoreList()[0].getSerchId())
        WebSiteRepository.getCurrentStoreEventLsit(storeId: StoreList.shared.getStoreList()[0].getSerchId()).then{ eventList -> Void in
            self.currentStoreEventList = eventList
            self.eventListCollection.delegate = self
            self.eventListCollection.dataSource = self
            self.eventListCollection.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventListCell", for: indexPath) as! EventListCollectionViewCell
        cell.image.kf.setImage(with: currentStoreEventList.getEventList()[indexPath.row].getEventURL()
        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentStoreEventList.getEventList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // storeIndex = indexPath.row
       // self.performSegue(withIdentifier: "mainToStore", sender: self)
    }
    
    func setNextIndex(){
        if (StoreList.shared.getStoreList().count - 1 > storeIndex) {
            storeIndex = storeIndex + 1
        } else {
            storeIndex = 0
        }
        eventListCollection.reloadData()
    }
    @IBAction func previusPressed(_ sender: Any) {
        storeIndex = StoreList.shared.getPreviusStoreSerch(curent: storeIndex)
        print(storeIndex)
        WebSiteRepository.getCurrentStoreEventLsit(storeId: storeIndex).then{ eventList -> Void in
            self.currentStoreEventList = eventList
            self.eventListCollection.reloadData()
        }
    }
    @IBAction func nextPressed(_ sender: Any) {
        storeIndex = StoreList.shared.getNextStoreSerch(curent: storeIndex)
        WebSiteRepository.getCurrentStoreEventLsit(storeId: storeIndex).then{ eventList -> Void in
            print(self.storeIndex)
            self.currentStoreEventList = eventList
            self.eventListCollection.reloadData()
        }
    }
}

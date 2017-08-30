//
//  ChooseStoreCollectionViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 02.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

private let reuseIdentifier = "delStoreCell"

class ChooseStoreCollectionViewController: UICollectionViewController {
    var storeList = StoreList.shared.getGorillaMenuList()
    var chosenIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self
        // Register cell classes
        //self.collectionView!.register(DelStoreCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DelStoreCollectionViewCell
    
        print(storeList[indexPath.row].getDefultImage())
        cell.image.image =  storeList[indexPath.row].getDefultImage()
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.chosenIndex = indexPath.row
        setUpSlide()
        //self.performSegue(withIdentifier: "ctd", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ctd") {
            let myEC = segue.destination as! DeliveryViewController
            myEC.currentStore = self.chosenIndex
        }
    }
    
    func setUpSlide() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "cartViewController")
        
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "deliveryViewController") as! DeliveryViewController
        mainViewController.currentStore = self.chosenIndex
        
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController,rightMenuViewController: rightViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
        appDelegate.window?.makeKeyAndVisible()
    }

    
}

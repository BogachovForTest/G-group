//
//  DeliveryViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 12.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import Kingfisher
import Material
import SlideMenuControllerSwift

class DeliveryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var itemCollection: UICollectionView!
    @IBOutlet weak var storeTitle: UIButton!
    var menu : [CurrentMenu]!
    var currentCategory: Int! = 2
    var currentStore: Int! = 2
    fileprivate var buttons = [Button]()
    fileprivate var tabBar: TabBar!
    @IBOutlet weak var tapBarView: TabBar!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setUpSlide()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        MenuRepo.shared.donwnloadMenu().then{ menu -> Void in
            self.menu = menu
            self.itemCollection.reloadData()
            self.prepareButtons()
        }
        itemCollection.delegate = self
        itemCollection.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.storeTitle.setTitle(menu[currentStore].getTitle(), for: .normal)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! DeliveryItemCollectionViewCell
        if (menu != nil){
            let item = menu[currentStore].getCategoryList()[currentCategory].getItemList()[indexPath.row]
            cell.descriptionLabel.text = item.getDescription()
            if (item.imageUrl != nil){
                cell.image.kf.setImage(with: item.getImageUrl())
            } else {
                cell.image.image = menu[currentStore].getDefultImage()
            }
            cell.titleLabel.text = item.getTitle()
            cell.priceLabel.text = String(item.getPrice()) + " $"
            cell.weightLabel.text = String(item.getWeight())
        }
        cell.layer.cornerRadius = 6
        cell.pluseButton.tag = indexPath.row
        cell.pluseButton.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func buttonClicked(sender: UIButton) {
        let item = menu[self.currentStore].getCategoryList()[self.currentCategory].getItemList()[sender.tag]
        let newCart = Cart(id: item.getId(), store: menu[currentStore].getTitle(), title: item.getTitle(), price: item.getPrice())
        CartListRepo.shared.addCart(newCart: newCart, store: menu[currentStore].getTitle())
        (self.slideMenuController()?.rightViewController as! RightViewController).tableView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(menu != nil){
            return menu[currentStore].getCategoryList()[currentCategory].getItemList().count
        } else {
            return 0
        }
    }
    
    @IBAction func cartPressed(_ sender: Any) {
        if (!(self.slideMenuController()?.isRightOpen())!) {
            self.slideMenuController()?.openRight()
        } else {
            self.slideMenuController()?.closeRight()
        }
    }
    
    func setUpSlide() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "cartViewController")
        
        let mainViewController = self
        
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController,rightMenuViewController: rightViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
        appDelegate.window?.makeKeyAndVisible()
    }
    
}

extension DeliveryViewController {
    fileprivate func prepareButtons() {
        MenuRepo.shared.donwnloadMenu().then{ menu -> Void in
            let categoryList = menu[self.currentStore].getCategoryList()
            for category in categoryList {
                
                let btn1 = FlatButton(title: category.getTitle(), titleColor: UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0))
                btn1.pulseAnimation = .none
                self.buttons.append(btn1)
            }
            self.buttons[0].titleColor = Color.white
            self.prepareTabBar()
        }
    }
    
    
    
    fileprivate func prepareTabBar() {
        tabBar = TabBar()
        tabBar.delegate = self
        tabBar.dividerColor = Color.grey.lighten3
        tabBar.dividerAlignment = .top
        
        tabBar.lineColor = UIColor(red:0.55, green:0.77, blue:0.25, alpha:1.0)
        tabBar.lineAlignment = .bottom
        
        tapBarView.backgroundColor = Color.black
        tabBar.backgroundColor = Color.black
        tabBar.buttons = buttons
        tabBar.frame = CGRect(x: tapBarView.x, y: tapBarView.y, width: tapBarView.width, height:tapBarView.height)
        
        
        view.addSubview(tabBar)
    }
}

extension DeliveryViewController: TabBarDelegate {
    func tabBar(tabBar: TabBar, willSelect button: UIButton) {
        
    }
    
    func tabBar(tabBar: TabBar, didSelect button: UIButton) {
        for button in buttons{
            button.titleColor = UIColor(red:0.67, green:0.67, blue:0.67, alpha:1.0)
        }
        button.setTitleColor(Color.white, for: .normal)
        currentCategory = buttons.index(of: button as! Button)
        itemCollection.reloadData()
    }
}

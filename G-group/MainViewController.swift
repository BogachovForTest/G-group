//
//  ViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 05.05.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import PromiseKit
import Kingfisher
import SlideMenuControllerSwift

class MainViewController:   UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout,
    UIScrollViewDelegate,
    iCarouselDelegate,
    iCarouselDataSource
    
{
    @IBOutlet weak var storeCollection: UICollectionView!
    @IBOutlet weak var akciaTitle: UILabel!
    @IBOutlet weak var aciaCarousel: iCarousel!
    @IBOutlet weak var acountText: UILabel!
    
    var eventIndex: Int = 0
    var storeIndex: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeCollection.delegate = self
        storeCollection.dataSource = self
        aciaCarousel.delegate = self
        aciaCarousel.dataSource = self
        aciaCarousel.type = .rotary
        test()
        
        WebSiteRepository.getEventList().then{ eventList -> Void in
            EventListSingleton.shared.setEventList(newEventList: eventList)
            self.aciaCarousel.reloadData()
        }
    }
    
    func test(){
        GorillaAuthRepo.shared.signIn().then{ token -> Void in
            print("token: ", token)
            let order = Order(userName: "Женя", userPhone: "+380635337250", noCall: 1, noSms: 1, peopleCount: 1, comment: "test", payType: "cart", time: "00")
            let cartList = [Cart(id: 3, count: 2)]
            let adress = "Пантелеймоновская 76"
            ReadyOrderRepo.shared.setCardList(newCartList: cartList)
            ReadyOrderRepo.shared.setOrder(newOrder: order)
            ReadyOrderRepo.shared.setAdress(newAdress: adress)
            ReadyOrderRepo.shared.mapForRequset()
            ReadyOrderRepo.shared.sendRequest().then { result -> Void in
                print(result)
            }

        }
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return EventListSingleton.shared.getEventList().getEventList().count
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let tempImage = UIView(frame: CGRect(x: 0, y: 0, width: 96, height:96))
        let frame = CGRect(x: 0, y: 0, width: 96, height:96)
        let imageView = ImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.contentMode = UIViewContentMode.scaleToFill
        imageView.kf.setImage(with: EventListSingleton.shared.getEventList().getEventList()[index].getEventURL())
        imageView.frame = frame
        tempImage.addSubview(imageView)
        return tempImage
    }
    
    func carousel(_ carousel: iCarousel, shouldSelectItemAt index: Int) -> Bool {
        self.eventIndex = index
        self.performSegue(withIdentifier: "toEvent", sender: self)
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEvent") {
            var myEC = segue.destination as! EventViewController
            myEC.eventInex = self.eventIndex
        } else if (segue.identifier == "mainToStore"){
            var mySC = segue.destination as! StoreViewController
            mySC.storeIndex = self.storeIndex
        }
    }
   
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing {
            return value * 1.2
        }
        return value
    }
    
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        self.akciaTitle.text = EventListSingleton.shared.getEventList().getEventList()[carousel.currentItemIndex].getEventTitle()
    }
    
    //AkciaCollection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storecell", for: indexPath) as! StoreCollectionViewCell
        cell.image.image = StoreList.shared.getStoreList()[indexPath.row].getStorePhoto()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoreList.shared.getStoreList().count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        storeIndex = indexPath.row
        self.performSegue(withIdentifier: "mainToStore", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCellInRow : Int = 2
        let padding : Int = 12
        let collectionCellWidth : CGFloat = ((self.view.frame.size.width - 48)/CGFloat(numberOfCellInRow)) - CGFloat(padding)
        return CGSize(width: collectionCellWidth , height: (collectionCellWidth/100*25) + collectionCellWidth)
    }
    
    func acountBtnLoad () {
        if(UserRepo.shared.isAuth()){
            //self.acountText.text = String(UserRepo.shared.getUser().getPoints())
        }
    }
    
    @IBAction func acountPressed(_ sender: Any) {
        if (UserRepo.shared.isAuth()){
            self.performSegue(withIdentifier: "fromMainToAcount", sender: self)
        } else {
            self.performSegue(withIdentifier: "fromMainToLogin", sender: self)
        }
    }
    
    @IBAction func burgerPressed(_ sender: Any) {
        if (!(self.slideMenuController()?.isLeftOpen())!) {
             self.slideMenuController()?.openLeft()
        } else {
            self.slideMenuController()?.closeLeft()
        }

    }
    
    @IBAction func deliveryPressed(_ sender: Any) {
        setUpSlide()
        //self.performSegue(withIdentifier: "toDelivery", sender: self)
    }
    
    func setUpSlide() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "cartViewController")
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "deliveryViewController")
        
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController,rightMenuViewController: rightViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    
}



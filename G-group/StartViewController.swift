//
//  StartViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 10.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class StartViewController: UIViewController {
//    let a = self as! StartViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        EventListSingleton.shared
        StoreList.shared
        UserRepo.shared
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        checkInternet()
            }
    
    func checkInternet(){
        if (ConnectionChecker.isInternetAvailable()) {
            WebSiteRepository.getEventList()
                .then{ eventList -> Void in
                    EventListSingleton.shared.setEventList(newEventList: eventList)
                }.then{
                    MenuRepo.shared.donwnloadMenu()
                        .then{ menu -> Void in
                            SlideMenuHelper.setUpSlide()
                            MenuRepo.shared.setMenu(newMenu: menu)
                           // self.performSegue(withIdentifier: "start", sender: self)
                    }
                }
        } else {
            // create the alert
            let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in
            self.checkInternet()
            }))
            
            // show the alert
            self.present(alert, animated: true, completion:  nil)
        }

    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  SlideMenuHelper.swift
//  G-group
//
//  Created by Евгений Богачев on 12.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import Foundation
import SlideMenuControllerSwift

class SlideMenuHelper {
    static func setUpSlide() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "leftViewController") as! LeftSlideViewController
        
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "cartViewController")
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "mainViewController") as! MainViewController
        
        
        let slideMenuController = SlideMenuController(mainViewController: mainViewController, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = slideMenuController
        appDelegate.window?.makeKeyAndVisible()
    }

}

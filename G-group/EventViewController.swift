//
//  EventViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 10.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import Kingfisher

class EventViewController: UIViewController {
    var eventInex : Int = 0
    
    @IBOutlet weak var eventPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("second", String(eventInex))
       eventPhoto.kf.setImage(with: EventListSingleton.shared.getEventList().getEventList()[eventInex].getEventURL())
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

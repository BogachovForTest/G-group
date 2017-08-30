//
//  LeftSlideViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 11.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class LeftSlideViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var acountLink: UIStackView!
    @IBOutlet weak var deliveryLink: UIStackView!
    @IBOutlet weak var eventLink: UIStackView!
    @IBOutlet weak var aboutUsLink: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTaps()
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2;
        self.profileImage.clipsToBounds = true;
        profileImage.image = #imageLiteral(resourceName: "acount_icon_black")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setUpTaps() {
        let acountGesture = UITapGestureRecognizer(target: self, action: #selector(LeftSlideViewController.acountLinkPressed(_:)))
        let deliveryGesture = UITapGestureRecognizer(target: self, action: #selector(LeftSlideViewController.deliveryLinkPressed(_:)))
        let eventGesture = UITapGestureRecognizer(target: self, action: #selector(LeftSlideViewController.eventLinkPressed(_:)))
        let aboutUsGesture = UITapGestureRecognizer(target: self, action: #selector(LeftSlideViewController.aboutUsLinkPressed(_:)))
        acountLink.addGestureRecognizer(acountGesture)
        deliveryLink.addGestureRecognizer(deliveryGesture)
        eventLink.addGestureRecognizer(eventGesture)
        aboutUsLink.addGestureRecognizer(aboutUsGesture)
    }
    
    func acountLinkPressed(_ sender:UITapGestureRecognizer){
        self.performSegue(withIdentifier: "fromLeftToLogin", sender: self)
    }
    
    func deliveryLinkPressed(_ sender:UITapGestureRecognizer){
        self.performSegue(withIdentifier: "fromLeftToDelivery", sender: self)
    }
    
    func eventLinkPressed(_ sender:UITapGestureRecognizer){
        self.performSegue(withIdentifier: "fromLeftToEventList", sender: self)
    }
    
    func aboutUsLinkPressed(_ sender:UITapGestureRecognizer){
        self.performSegue(withIdentifier: "fromLeftToAboutUs", sender: self)
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

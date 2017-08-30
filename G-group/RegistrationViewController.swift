//
//  RegistrationViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 13.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import DLRadioButton

class RegistrationViewController: UIViewController {
    @IBOutlet weak var mobileNumberEdit: UITextField!

  
    
   
    @IBOutlet weak var birthdayEdit: UITextField!
    @IBOutlet weak var emailEdit: UITextField!
    @IBOutlet weak var cardLocationEdit: UITextField!
    @IBOutlet weak var FIOEdit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        editSetUp(textField: birthdayEdit)
        editSetUp(textField: emailEdit)
        editSetUp(textField: cardLocationEdit)
        editSetUp(textField: FIOEdit)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func editSetUp(textField: UITextField){
        underline(textField: textField)
        plaseHolderSetUp(textField: textField)
    }
    
    func underline(textField: UITextField){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height + 4)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.textColor = UIColor.white
        textField.layer.masksToBounds = true
    }
    
    func plaseHolderSetUp(textField: UITextField) {
        let str = NSAttributedString(string: textField.placeholder!, attributes: [NSForegroundColorAttributeName:UIColor.white])
        textField.attributedPlaceholder = str
    }


}

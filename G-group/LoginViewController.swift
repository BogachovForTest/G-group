//
//  LoginViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 12.07.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passEdit: UITextField!
    @IBOutlet weak var numberEdit: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        plaseHolderSetUp(textField: passEdit)
        plaseHolderSetUp(textField: numberEdit)
        underline(textField: passEdit)
        underline(textField: numberEdit)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerPressed(_ sender: Any) {
    }
    
    @IBAction func forgetPressed(_ sender: Any) {
    }
    
    @IBAction func loginPressed(_ sender: Any) {
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

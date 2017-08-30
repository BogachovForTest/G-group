//
//  OrderViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 06.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit
import DLRadioButton
import SlideMenuControllerSwift

class OrderViewController: UIViewController {
    @IBOutlet weak var nameEdit: UITextField!
    @IBOutlet weak var numberEdit: UITextField!
    @IBOutlet weak var firstAdressEdit: UITextField!
    @IBOutlet weak var secondAdressEdit: UITextField!
    @IBOutlet weak var commentsEdit: UITextField!
    @IBOutlet weak var peopleCountEdit: UITextField!
    @IBOutlet weak var callRadio: DLRadioButton!
    @IBOutlet weak var smsRadio: DLRadioButton!
    @IBOutlet weak var nowRadio: DLRadioButton!
    @IBOutlet weak var laterRadio: DLRadioButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var order = Order()
    var adress: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func confirmePressed(_ sender: Any) {
        //        if (checkDataCorectly()){
        //            setOrder()
        //            ReadyOrderRepo.shared.setCardList(newCartList: CartListRepo.shared.getCartList())
        //            ReadyOrderRepo.shared.setOrder(newOrder: order)
        //            ReadyOrderRepo.shared.setAdress(newAdress: adress)
        //            ReadyOrderRepo.shared.mapForRequset()
        //            ReadyOrderRepo.shared.sendRequest().then { result -> Void in
        //                print(result)
        //            }
        //        }
    }
    
    func checkDataCorectly() -> Bool {
        var right = true
        if (isItClear(view: nameEdit) == true ||
            isItClear(view: numberEdit) == true ||
            isItClear(view: firstAdressEdit) == true ||
            isItClear(view: secondAdressEdit) == true ||
            isItClear(view: commentsEdit) == true ||
            isItClear(view: peopleCountEdit) == true
            ){
            makeToast(text: "Пожалуйста заполните все поля")
            right = false
        }
        return right
    }
    
    func isItClear(view: UITextField) -> Bool {
        if (view.text == ""){
            return true
        } else {
            return false
        }
    }
    
    func setOrder() {
        order.setUserName(newUserName: nameEdit.text!)
        order.setUserPhone(newUserPhone: numberEdit.text!)
        if (smsRadio.isSelected){
            order.setNoSms(state: 1)
        }
        if (callRadio.isSelected){
            order.setNoCall(state: 1)
        }
        order.setPeopleCount(newCount: Int(peopleCountEdit.text!)!)
        order.setComment(newComment: commentsEdit.text!)
        adress = firstAdressEdit.text! + " " + secondAdressEdit.text!
    }
    
    func makeToast(text: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = text
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        UIView.animate(withDuration: 4.0, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            toastLabel.alpha = 0.0
        })
    }
    
    func setUpView(){
        callRadio.isMultipleSelectionEnabled = true
        smsRadio.isMultipleSelectionEnabled = true
        datePicker.isHidden = true
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowOffset = CGSize.zero
        contentView.layer.shadowRadius = 6
        nameEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        nameEdit.layer.borderWidth = 1
        nameEdit.layer.cornerRadius = 6
        numberEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        numberEdit.layer.borderWidth = 1
        numberEdit.layer.cornerRadius = 6
        commentsEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        commentsEdit.layer.borderWidth = 1
        commentsEdit.layer.cornerRadius = 6
        peopleCountEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        peopleCountEdit.layer.borderWidth = 1
        peopleCountEdit.layer.cornerRadius = 6
        firstAdressEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        firstAdressEdit.layer.borderWidth = 1
        firstAdressEdit.layer.cornerRadius = 6
        secondAdressEdit.layer.borderColor = UIColor(red:1.00, green:0.85, blue:0.19, alpha:1.0).cgColor
        secondAdressEdit.layer.borderWidth = 1
        secondAdressEdit.layer.cornerRadius = 6
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
    
    
    @objc @IBAction private func logSelectedButton(radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
        } else {
            if (radioButton.titleLabel!.text! == "На сейчас"){
                datePicker.isHidden = true
            } else {
                datePicker.isHidden = false
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any){
        setUpSlide()
    }
    
}

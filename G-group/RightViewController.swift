//
//  RightViewController.swift
//  G-group
//
//  Created by Евгений Богачев on 03.08.17.
//  Copyright © 2017 g-group. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stackView: UIStackView!
    var listToAdapter: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 44.0;
        
        
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        listToAdapter = CartListRepo.shared.mapToAdapter()
        if ( indexPath.row == listToAdapter.count){
            return createButtonCell()
        } else {
            if let image = listToAdapter[indexPath.row] as? UIImage{
                return createImageCell(image: image)
            } else {
                return createItmeCell(indexPath: indexPath)
            }
        }
    }
    
    func createButtonCell() -> UITableViewCell{
        let cell = UITableViewCell()
        let tempButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.width   , height: cell.height))
        tempButton.contentMode = UIViewContentMode.scaleToFill
        tempButton.setImage(#imageLiteral(resourceName: "make-order-btn"), for: .normal)
        tempButton.addTarget(self, action: #selector(self.confirmClicked(sender:)), for: UIControlEvents.touchUpInside)
        cell.backgroundColor = self.view.backgroundColor
        cell.contentView.addSubview(tempButton)
        return cell
    }
    
    
    func createImageCell(image: UIImage) -> UITableViewCell{
        let cell = UITableViewCell()
        let tempImage = UIImageView(frame: CGRect(x: tableView.width/3.5, y: 0, width: 96, height: cell.height))
        tempImage.contentMode = UIViewContentMode.scaleToFill
        tempImage.image = image
        cell.contentView.addSubview(tempImage)
        cell.backgroundColor = self.view.backgroundColor
        return cell
    }
    
    func createItmeCell(indexPath: IndexPath) -> MenuTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableItem",
                                                 for: indexPath) as! MenuTableViewCell
        let cart = listToAdapter[indexPath.row] as! Cart
        cell.countLabel.text = "x " + String(cart.getCount())
        cell.priceLabel.text = String(describing: cart.getPrice()) + " $"
        cell.titleLabel.text = cart.getTitle()
        cell.plusButton.tag = indexPath.row
        cell.plusButton.addTarget(self, action: #selector(self.plusClicked(sender:)), for: UIControlEvents.touchUpInside)
        cell.minusButton.tag = indexPath.row
        cell.minusButton.addTarget(self, action: #selector(self.minusClicked(sender:)), for: UIControlEvents.touchUpInside)
        return cell
    }
    
    func plusClicked(sender: UIButton) {
      CartListRepo.shared.addCount(cartId: (listToAdapter[sender.tag] as! Cart).getId())
        tableView.reloadData()
    }
    
    func minusClicked(sender: UIButton) {
       CartListRepo.shared.lessCount(cartId: (listToAdapter[sender.tag] as! Cart).getId())
        tableView.reloadData()
    }
    
    func confirmClicked(sender: UIButton) {
        GorillaAuthRepo.shared.signIn()
        self.performSegue(withIdentifier: "rightToConfirm", sender: self)
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listToAdapter = CartListRepo.shared.mapToAdapter()
        if (listToAdapter.count > 0){
            return listToAdapter.count + 1
        } else {
            return 0
        }
    }
}

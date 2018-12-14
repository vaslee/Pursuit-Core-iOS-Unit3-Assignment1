//
//  DetailUserInfoViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/10/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class DetailUserInfoViewController: UIViewController {

    @IBOutlet weak var userPicture: UIImageView!
    
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userLocation: UILabel!
    var userInformation: InfoWrapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        
userLocation.text = userInformation.location.state.capitalized
        userName.text = userInformation.name.first.capitalized + " " + userInformation.name.last.capitalized
        userEmail.text = userInformation.email
        
       
        
    }
   
}

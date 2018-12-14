//
//  StockDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockDetailViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var openLabel: UILabel!
    
    @IBOutlet weak var closeLabel: UILabel!
    
    var stockInformation: Applstockinfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = stockInformation.date
        openLabel.text = "$" + String(format: "%.2f", stockInformation.open)
        closeLabel.text = "$" + String(format: "%.2f", stockInformation.close)
        
        
        if stockInformation.close > stockInformation.open {
        image.image = UIImage(named: "thumbsUp")
            view.backgroundColor = .green
        } else {
        image.image = UIImage(named: "thumbsDown")
        view.backgroundColor = .red
        }
    
    }
}

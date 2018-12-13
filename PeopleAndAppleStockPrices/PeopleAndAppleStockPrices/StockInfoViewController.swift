//
//  StockInfoViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockInfoViewController: UIViewController {

    
    @IBOutlet weak var priceTagLabel: UILabel!
    @IBOutlet weak var stockTableView: UITableView!
    var stockInfo = [Applstockinfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runData()
        stockTableView.dataSource = self
        
        title = "StockInfo"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = stockTableView.indexPathForSelectedRow,
            let DetailStockInfoViewController = segue.destination as? StockDetailViewController else { fatalError("missing indexPath, StockDetailViewController") }
        let stocks = stockInfo[indexPath.row]
        
        DetailStockInfoViewController.stockInformation = stocks
    }
    
    
    
    func runData() {
        if let path = Bundle.main.path(forResource: "applstockinfo", ofType: "json") {
            let myUrl = URL.init(fileURLWithPath: path)
                if let myData = try? Data.init(contentsOf: myUrl) {
                    do {
                        self.stockInfo = try JSONDecoder().decode([Applstockinfo].self, from: myData)
                      
                    } catch {
                        print(error)
                    }
                }
            }
        }
        
}


extension StockInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "November-2016:Avrage:"
        case 1:
            return "Januay-2017:Avrage:"
        case 2:
            return "February-2017:Avrage:"
        case 3:
            return "March-2017:Avrage:"
        case 4:
            return "April-2017:Avrage:"
        case 5:
            return "May-2017:Avrage:"
        case 6:
            return "June-2017:Avrage:"
        default:
            return "Unknown"
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = stockTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stockInfoToSet = stockInfo[indexPath.row]
        cell.textLabel?.text = stockInfoToSet.date
        cell.detailTextLabel?.text = "$" + String(format: "%.2f", stockInfoToSet.open)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockInfo.count
    }
    
    
    }

        
        




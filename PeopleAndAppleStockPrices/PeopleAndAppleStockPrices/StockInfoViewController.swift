//
//  StockInfoViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/11/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class StockInfoViewController: UIViewController {

    
    @IBOutlet weak var stockTableView: UITableView!
    var stockInfo = [Applstockinfo]()
    var stockByDate = [[Applstockinfo]]()
    
//    for i in stockInfo {
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "StockInfo"
        runData()
        stockTableView.dataSource = self

        for year in 2016...2018 {
            for month in 1...12 {
                var newMonth = ""
                if month < 10 {
                    newMonth = "0\(month.description)"
                } else {
                    newMonth = "\(month.description)"
                }
                let filteredArr = stockInfo.filter{getDateMonth(dateString: $0.date).month == newMonth && getDateMonth(dateString: $0.date).year  == year.description}
                if !filteredArr.isEmpty {
                    stockByDate.append(filteredArr)
                }
        }
        }
        print(stockByDate)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = stockTableView.indexPathForSelectedRow,
            let DetailStockInfoViewController = segue.destination as? StockDetailViewController else { fatalError("missing indexPath, StockDetailViewController") }
        let stocks = stockInfo[indexPath.row]
        
        DetailStockInfoViewController.stockInformation = stocks
    }
    
 
    
    func getDateMonth(dateString: String) -> (month: String, year: String) {
            let components = dateString.components(separatedBy: "-")
            return (components[1], components[0])
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return stockByDate.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let dateString = stockByDate[section].first?.date else {
            return "No Date"
        }
        
        var totalAverage = 0.0
        for i in 0..<stockByDate[section].count {
            totalAverage += stockByDate[section][i].open
        }
        
        return "\(String.formattedDate(str: dateString)) Average:\(String(format: "%.2f", totalAverage/Double(stockByDate[section].count)))"
    

      
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = stockTableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stockInfoToSet = stockByDate[indexPath.section][indexPath.row]
        cell.textLabel?.text = stockInfoToSet.date
        cell.detailTextLabel?.text = "$" + String(format: "%.2f", stockInfoToSet.open)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stockByDate[section].count
    }
    
    
    }

        
        




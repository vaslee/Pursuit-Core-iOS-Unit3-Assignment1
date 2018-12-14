//
//  Applstockinfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct Applstockinfo: Codable {
    let date: String
    let open: Double
    let high:Double
    let low: Double
    let close: Double
    let volume:Int
    let unadjustedVolume: Int
    let change: Double
    let changePercent: Double
    let vwap: Double
    let label: String
    let changeOverTime: Double
}

extension String {
    // input String date e.g 2018-12-19 - from Meetup JSON
    // output e.g Decemeber 19, 2018
    static func formattedDate(str: String) -> String {
        var formattedString = str
        // DateFormatter()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // create a Date()
        if let date = dateFormatter.date(from: formattedString) {
            dateFormatter.dateFormat = "MMMM-yyyy"
            formattedString = dateFormatter.string(from: date)
        } else {
            print("formattedDate: invalid date")
        }
        return formattedString
    }
}










//let stockPrice1 = Applstockinfo(date: "2016-10-09", String(open: 145.0, close: 145.50))
//let stockPrice2 = Applstockinfo(date: "2016-10-10", String(open: 145.0, close: 145.50))
//let stockPrice3 = Applstockinfo(date: "2016-11-12", String(open: 145.0, close: 145.50))
//let stockPrice4 = Applstockinfo(date: "2016-11-13", String(open: 145.0, close: 145.50))
//let stockPrice5 = Applstockinfo(date: "2016-12-20", String(open: 145.0, close: 145.50))
//let stockPrice6 = Applstockinfo(date: "2016-12-21", String(open: 145.0, close: 145.50))
//let stockPrice7 = Applstockinfo(date: "2017-01-04", String(open: 145.0, close: 145.50))
//let stockPrice8 = Applstockinfo(date: "2017-01-05", String(open: 145.0, close: 145.50))
//


//// 1. get all stocks parsed from the JSON file
//let allPrices = [stockPrice1, stockPrice2, stockPrice3, stockPrice4,
//                 stockPrice5, stockPrice6, stockPrice7, stockPrice8]
//
//// 2. create a 2d array of Stock Prices [[StockPrice]]()
//var stockPrices = [[Applstockinfo]]()
//
//// 3. as you iterate through all stock prices from step 1. put into array buckets
//
//// 4. create an initial empty array inside 2d array before entering loop from step 3.
//stockPrices.append([Applstockinfo]())
//
//// create a variable previousData
//var previousDate = ""
//
//// create initial start index
//var startIndex = 0
//for stockPrice in allPrices {
//    let dateMonth = getDateMonth(dateString: stockPrice.date)
//    let currentDate = dateMonth.month + "-" + dateMonth.year
//    if previousDate.isEmpty { previousDate = dateMonth.month + "-" + dateMonth.year }
//    
//    if currentDate != previousDate {
//        // new bucket
//        stockPrices.append([Applstockinfo]())
//        
//        // increment startIndex
//        startIndex += 1
//    }
//    stockPrices[startIndex].append(stockPrice)
//    previousDate = dateMonth.month + "-" + dateMonth.year
//}
//
//
//print(stockPrices.count)
//}

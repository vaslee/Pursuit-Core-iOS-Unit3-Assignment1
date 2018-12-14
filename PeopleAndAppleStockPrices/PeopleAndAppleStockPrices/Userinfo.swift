//
//  Userinfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by TingxinLi on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

struct Userinfo: Codable {
    let results: [InfoWrapper]
}

struct InfoWrapper: Codable {
    let gender: String
    let name: NameWrapper
    let location: LocationWrapper
    let email: String
    let picture: PictureWrapper
}

struct PictureWrapper: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct NameWrapper: Codable {
    let title: String
    let first: String
    let last: String

    }


struct LocationWrapper: Codable {
    let street: String
    let city: String
    let state: String
    let postcode: String
    
}

//
//  StadiumInfo.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 07.04.2023.
//

import UIKit

struct StadiumInfo {
    
    let name: String
    let address: String
    let openHours: String
    let coordinates: Coordinates
    var currentDistanceTo: String?
    let phoneNumber: String
    let webSite: String
    let photo: UIImage?
}

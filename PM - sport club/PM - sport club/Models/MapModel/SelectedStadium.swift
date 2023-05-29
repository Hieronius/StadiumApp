//
//  SelectedStadium.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 17.04.2023.
//

import Foundation

struct SelectedStadium {
    
    static var shared = SelectedStadium()
    
    var selectedStadium: StadiumInfo?
}

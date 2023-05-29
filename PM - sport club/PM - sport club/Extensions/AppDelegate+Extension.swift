//
//  AppDelegate + Extension.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 21.03.2023.
//

import IQKeyboardManagerSwift
 
extension AppDelegate {
 
    private func IQKeyboardManagerSetup() {
            IQKeyboardManager.shared.enable = true
            
            IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Готово"
            IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        }
    
}

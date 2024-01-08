//
//  model.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 08/01/2024.
//

import Foundation

enum SettingsOptions: CaseIterable {
    case View_Profile
    case Switch_to_tab_1_Root
    
    static var count: Int {
            return self.allCases.count
        }
    
    func displayName() -> String {
        switch self {
        case .View_Profile:
            return "View Profile"
        case .Switch_to_tab_1_Root:
            return "Switch to Tab 1 Root"
        }
    }
}

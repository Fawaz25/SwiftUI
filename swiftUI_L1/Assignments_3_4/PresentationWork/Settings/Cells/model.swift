//
//  model.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 08/01/2024.
//

import Foundation

enum SettingsOptions: CaseIterable {
    case View_Profile
    case Student_Listing_Tab
    
    static var count: Int {
        return self.allCases.count
    }
    
    func displayName() -> String {
        switch self {
        case .View_Profile:
            return "View Profile"
        case .Student_Listing_Tab:
            return "Student Listing Tab"
        }
    }
}



////
////  Coordinator.swift
////  swiftUI_L1
////
////  Created by Fawaz Ahmed Tahir on 09/01/2024.
////
//
//import Foundation
//import SwiftUI
//import UIKit
//
//enum Page: String, Identifiable{
//    case studentTabView, profileView, UIKitSettingsView
//    var id: String{
//        self.rawValue
//    }
//}
//
////enum Sheet: String, Identifiable{
////    case profileView, UIKitSettingsView ,studentList, AddStudentView, StudentDetailView
////    var id: String{
////        self.rawValue
////    }
////    
////}
//
//
//class Coordinator: ObservableObject{
////    @Published var currentPage: Page = .studentTabView
//
//    @Published var path = NavigationPath()
////    @Publis/*hed var sheet: Sheet?*/
//    
//    func push(_ page: Page){
//        path.append(page)
//    }
//    
//    func present(){
//        
//    }
//    
//    func popToRoot(){
//        path.removeLast(path.count+1)
//    }
//    
//    @ViewBuilder
//    func build (page: Page) -> some View{
//        switch page {
//        case .studentTabView:
//            StudentTabView()
//        case .profileView:
//            ProfileView()
//        case .UIKitSettingsView:
//            UIKitSettingsView()
//        }
//    }
//}

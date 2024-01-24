////
////  CoordinatorView.swift
////  swiftUI_L1
////
////  Created by Fawaz Ahmed Tahir on 09/01/2024.
////
//
//import SwiftUI
//
//struct CoordinatorView: View {
//    
//    @StateObject private var coordinator = Coordinator()
//    var body: some View {
//        NavigationStack(path: $coordinator.path){
//            coordinator.build(page: .studentTabView)
//                .navigationDestination(for: Page.self){
//                    page in coordinator.build(page: page)
//                }
////                .sheet()
//        }
//        .environmentObject(coordinator)
//        
//    }
//}
//
//#Preview {
//    CoordinatorView()
//}

//
//  TabView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 20/11/2023.
//
import SwiftUI

struct StudentTabView: View {
    @State var selectedIndex = 0
    @State var showMenu = false
    
    var body: some View {
        VStack {
            ZStack {
                TabView(selection: $selectedIndex) {
                    ListView(showMenu: $showMenu)
                        .tabItem { Text("Students") }
                        .tag(0)
                    // Second tab with UIKit view controller
                    UIKitSettingsView()
                        .tabItem { Text("Settings") }
                        .tag(1)
                }
                SideMenu(isShowing: $showMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $showMenu)))
            }
        }
    }
}

// UIKit view controller for Settings tab
struct UIKitSettingsView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController // Embed in a navigation controller
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let settingsViewController = SettingsViewController()
        let navigationController = UINavigationController(rootViewController: settingsViewController) // Embed in navigation controller
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Update UI or pass data to the UIKit view controller if needed
    }
}

#Preview {
    StudentTabView()
}

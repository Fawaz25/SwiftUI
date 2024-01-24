//
//  TabView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 20/11/2023.
//
import SwiftUI

struct StudentTabView: View {
    @State private var selectedIndex = 0
    @State private var showMenu = false
    @State private var settingNavigationStack: [SettingNavigation] = []

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    TabView(selection: $selectedIndex) {
                        // First tab with student list
                        ListView(showMenu: $showMenu)
                            .tabItem { Text("Students") }
                            .tag(0)

                        UIKitSettingsView(selectedIndex: $selectedIndex, settingNavigationStack: $settingNavigationStack)
                            .tabItem { Text("Settings") }
                            .tag(1)
                    }
                    SideMenu(isShowing: $showMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $showMenu)))
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}

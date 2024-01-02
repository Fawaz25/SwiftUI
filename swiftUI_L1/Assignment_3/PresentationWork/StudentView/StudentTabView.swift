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
                    Text("Setting View")
                        .tabItem { Text("Settings") }
                        .tag(1)
                }
                SideMenu(isShowing: $showMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $showMenu)))
            }

        }
    }
}

#Preview {
    StudentTabView()
}

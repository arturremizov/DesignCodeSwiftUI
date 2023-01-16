//
//  AppTabView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct AppTabView: View {
    
    @State var selectedTab: TabItem = .home
    
    var body: some View {
        TabBar(selection: $selectedTab) {
            HomeView()
                .tabBarItem(tab: .home)
            Text("Explore")
                .tabBarItem(tab: .explore)
            Text("Notifications")
                .tabBarItem(tab: .notifications)
            Text("Library")
                .tabBarItem(tab: .library)
        }
    }
}

struct AppTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}

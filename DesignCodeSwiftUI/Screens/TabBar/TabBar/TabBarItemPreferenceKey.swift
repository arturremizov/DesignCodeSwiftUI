//
//  TabBarItemPreferenceKey.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 14.01.23.
//

import SwiftUI

struct TabBarItemPreferenceKey: PreferenceKey {
    
    static var defaultValue: [TabItem] = []
    
    static func reduce(value: inout [TabItem], nextValue: () -> [TabItem]) {
        value += nextValue()
    }
}


struct TabBarItemViewModifiler: ViewModifier {
    
    let tab: TabItem
    @Environment(\.selectedTabBarItem) var selectedTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selectedTabBarItem == tab ? 1 : 0)
            .preference(key: TabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    func tabBarItem(tab: TabItem) -> some View {
        modifier(TabBarItemViewModifiler(tab: tab))
    }
}

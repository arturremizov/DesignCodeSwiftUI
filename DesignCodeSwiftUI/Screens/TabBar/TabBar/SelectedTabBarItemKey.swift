//
//  SelectedTabBarItemKey.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 14.01.23.
//

import SwiftUI

private struct SelectedTabBarItemKey: EnvironmentKey {
    static let defaultValue: TabItem = .home
}

extension EnvironmentValues {
    
    var selectedTabBarItem: TabItem {
        get { self[SelectedTabBarItemKey.self] }
        set { self[SelectedTabBarItemKey.self] = newValue }
    }
}

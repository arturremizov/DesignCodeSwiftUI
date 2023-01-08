//
//  TabItem.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case home
    case explore
    case notifications
    case library
    
    var title: String {
        switch self {
        case .home:
            return "Learn now"
        case .explore:
            return "Explore"
        case .notifications:
            return "Notifications"
        case .library:
            return "Library"
        }
    }
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .explore:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        case .library:
            return "rectangle.stack"
        }
    }
}


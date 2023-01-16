//
//  ShowTabBarPreferenceKey.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 16.01.23.
//

import SwiftUI

struct ShowTabBarPreference: Equatable {
    let hidden: Bool
    let animated: Bool
}

struct ShowTabBarPreferenceKey: PreferenceKey {
    
    static var defaultValue: ShowTabBarPreference = ShowTabBarPreference(hidden: false, animated: false)
    
    static func reduce(value: inout ShowTabBarPreference, nextValue: () -> ShowTabBarPreference) {
        value = nextValue()
    }
}

extension View {
    
    func tabBarHidden(_ hidden: Bool, animated: Bool = true) -> some View {
        preference(key: ShowTabBarPreferenceKey.self, value: ShowTabBarPreference(hidden: hidden, animated: animated))
    }
}

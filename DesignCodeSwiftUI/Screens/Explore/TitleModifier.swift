//
//  TitleModifier.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(20)
            .accessibilityAddTraits(.isHeader)
    }
}

extension View {
    func sectionTitleStyle() -> some View {
        modifier(TitleModifier())
    }
}

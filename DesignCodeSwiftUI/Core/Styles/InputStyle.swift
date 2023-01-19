//
//  InputStyle.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI

struct InputStyle: ViewModifier {
    
    let iconName: String
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .padding(.leading, 40)
            .background(
                .thinMaterial,
                in: RoundedRectangle(cornerRadius: 20, style: .continuous)
            )
            .strokeStyle(cornerRadius: 20)
            .overlay {
                Image(systemName: iconName)
                    .foregroundColor(.secondary)
                    .frame(width: 36, height: 36)
                    .background(
                        .thinMaterial,
                        in: RoundedRectangle(cornerRadius: 20, style: .continuous)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(8)
            }
    }
}

extension View {
    func inputStyle(iconName: String) -> some View {
        modifier(InputStyle(iconName: iconName))
    }
}

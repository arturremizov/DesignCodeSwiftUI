//
//  StrokeStyle.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
    
    let cornerRadius: CGFloat
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(colorScheme == .dark ? 0.3 : 0.3), .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.overlay)
            }
    }
}

struct RoundedCornerStrokeStyle: ViewModifier {
    
    let cornerRadius: CGFloat
    let corners: UIRectCorner
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedCornerShape(radius: cornerRadius, corners: corners)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(colorScheme == .dark ? 0.6 : 0.3), .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.overlay)
            }
    }
}

extension View {
    
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
    
    func strokeStyle(cornerRadius: CGFloat, corners: UIRectCorner) -> some View {
        modifier(RoundedCornerStrokeStyle(cornerRadius: cornerRadius, corners: corners))
    }
}

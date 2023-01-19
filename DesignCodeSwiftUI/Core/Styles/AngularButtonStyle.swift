//
//  AngularButtonStyle.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI

struct AngularButtonStyle: ButtonStyle {
    
    @Environment(\.controlSize) var controlSize
    
    var extraPadding: CGFloat {
        switch controlSize {
        case .mini, .small:
            return 0
        case .regular:
            return 4
        case .large:
            return 12
        @unknown default:
            return 0
        }
    }
    
    var cornerRadius: CGFloat {
        switch controlSize {
        case .mini, .small:
            return 12
        case .regular:
            return 16
        case .large:
            return 20
        @unknown default:
            return 12
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.horizontal, 10 + extraPadding)
            .padding(.vertical, 4 + extraPadding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        .linearGradient(
                            colors: [Color(.systemBackground), Color(.systemBackground).opacity(0.6)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .blendMode(.softLight)
            )
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        .angularGradient(
                            colors: [.pink, .purple, .blue, .pink],
                            center: .center,
                            startAngle: .degrees(-90),
                            endAngle: .degrees(270)
                        )
                    )
                    .blur(radius: cornerRadius)
            )
            .strokeStyle(cornerRadius: cornerRadius)
            .opacity(configuration.isPressed ? 0.6 : 1)
    }
}

extension ButtonStyle where Self == AngularButtonStyle {
    static var angular: Self {
        return .init()
    }
}

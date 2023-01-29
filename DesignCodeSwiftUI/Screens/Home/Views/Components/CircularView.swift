//
//  CircularView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 28.01.23.
//

import SwiftUI

struct CircularView: View {
    
    let value: CGFloat
    let lineWidth: CGFloat
    @State private var appear: Bool = false
    
    init(value: CGFloat, lineWidth: CGFloat = 4) {
        self.value = value
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0)
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .fill(
                .angularGradient(
                    colors: [.purple, .pink, .purple],
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                )
            )
            .rotationEffect(.degrees(270))
            .onAppear {
                withAnimation(.spring().delay(0.5)) {
                    appear = true
                }
            }
            .onDisappear {
                appear = false
            }
    }
}

struct CircularView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView(value: 0.2)
    }
}

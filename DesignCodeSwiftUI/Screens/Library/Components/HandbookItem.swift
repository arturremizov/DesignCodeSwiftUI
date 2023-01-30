//
//  HandbookItem.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct HandbookItem: View {
    
    let handbook: Handbook
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay {
                    Image(handbook.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 100)
                    
                }
            Text(handbook.title)
                .fontWeight(.semibold)
                .layoutPriority(1)
            Text(handbook.subtitle)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            Text(handbook.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    .linearGradient(
                        colors: [handbook.color1, handbook.color2],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .rotation3DEffect(.degrees(10), axis: (x: 0, y: 1, z: 0), anchor: .bottomTrailing)
                .rotationEffect(.degrees(180))
                .padding(.trailing, 40)
        )
    }
}

struct HandbookItem_Previews: PreviewProvider {
    static var previews: some View {
        HandbookItem(handbook: dev.handbook)
    }
}

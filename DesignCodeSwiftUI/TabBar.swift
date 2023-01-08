//
//  TabBar.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct TabBar: View {
    
    private let tabItems: [TabItem] = [
        TabItem(title: "Learn now", iconName: "house"),
        TabItem(title: "Explore", iconName: "magnifyingglass"),
        TabItem(title: "Notifications", iconName: "bell"),
        TabItem(title: "Library", iconName: "rectangle.stack")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ContentView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                Spacer()
                ForEach(tabItems) { item in
                    VStack(spacing: 0.0) {
                        Image(systemName: item.iconName)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 44, height: 29)
                        Text(item.title)
                            .font(.caption2)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 34, style: .continuous)
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

//
//  TabBar.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct TabBar: View {

    @State var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            tabBarViews
            tabBar
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension TabBar {
    
    private var tabBarViews: some View {
        Group {
            switch selectedTab {
            case .home:
                Text("Learn now")
            case .explore:
                Text("Explore")
            case .notifications:
                Text("Notifications")
            case .library:
                Text("Library")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var tabBar: some View {
        HStack {
            Spacer()
            ForEach(TabItem.allCases, id: \.self) { item in
                Button {
                    selectedTab = item
                } label: {
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
                .foregroundStyle(selectedTab == item ? .primary : .secondary)
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

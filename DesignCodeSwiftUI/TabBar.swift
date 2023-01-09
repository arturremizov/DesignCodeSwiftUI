//
//  TabBar.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct TabBar: View {

    @State var selectedTab: TabItem = .home
    @State private var tabItemWidth: CGFloat = 0
    
    private let backgroundCornerRadius: CGFloat = 34
    
    var body: some View {
        ZStack(alignment: .bottom) {
            tabBarContentViews
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
    
    private var tabBarContentViews: some View {
        ZStack {
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
        .animation(nil, value: selectedTab)
    }
    
    private var tabBar: some View {
        HStack {
            tabBarButtons
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: backgroundCornerRadius, style: .continuous)
        )
        .background(tabBarBackgroundCircle)
        .overlay(selectedTabIndicator)
        .strokeStyle(cornerRadius: backgroundCornerRadius)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var tabBarButtons: some View {
        ForEach(TabItem.allCases, id: \.self) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item
                }
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
            .blendMode(selectedTab == item ? .overlay : .normal)
            .readSize { size in
                if selectedTab == item {
                    tabItemWidth = size.width
                }
            }
        }
    }
    
    private var tabBarBackgroundCircle: some View {
        HStack {
            if selectedTab == .explore || selectedTab == .library {
                Spacer()
            } else if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            
            Circle()
                .fill(selectedTab.color)
                .frame(width: tabItemWidth)
            
            if selectedTab == .home || selectedTab == .notifications {
                Spacer()
            } else if selectedTab == .explore {
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
    
    private var selectedTabIndicator: some View {
        HStack {
            if selectedTab == .explore || selectedTab == .library {
                Spacer()
            } else if selectedTab == .notifications {
                Spacer()
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 3, style: .continuous)
                .fill(selectedTab.color)
                .frame(width: 28, height: 5)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            
            if selectedTab == .home || selectedTab == .notifications {
                Spacer()
            } else if selectedTab == .explore {
                Spacer()
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

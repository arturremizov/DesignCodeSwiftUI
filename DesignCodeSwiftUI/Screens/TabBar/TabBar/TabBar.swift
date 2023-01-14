//
//  TabBar.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct TabBar<Content: View>: View {
    
    @Binding var selection: TabItem
    let content: Content
    
    @State private var tabs: [TabItem] = []
    @Namespace private var namespace
    
    init(selection: Binding<TabItem>, @ViewBuilder content: () -> Content) {
        _selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .animation(nil, value: selection)
                .environment(\.selectedTabBarItem, selection)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .safeAreaInset(edge: .bottom) {
                    Color.clear
                        .frame(height: 56)
                }
            HStack {
                tabBarButtons
            }
            .padding(.top, 12)
            .padding(.bottom, 2)
            .padding(.horizontal, 8)
            .background(backgroundLayer)
            .background(backgroundCircleLayer)
            .overlay(selectedTabIndicator)
        }
        .onPreferenceChange(TabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State(initialValue: .home) var selection: TabItem
        
        var body: some View {
            TabBar(selection: $selection) {
                Text("Learn now")
                    .tabBarItem(tab: .home)
                Text("Explore")
                    .tabBarItem(tab: .explore)
                Text("Notifications")
                    .tabBarItem(tab: .notifications)
                Text("Library")
                    .tabBarItem(tab: .library)
            }
        }
    }
}

extension TabBar {
    
    private var tabBarButtons: some View {
        ForEach(tabs, id: \.self) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selection = item
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
            .foregroundStyle(selection == item ? .primary : .secondary)
            .blendMode(selection == item ? .overlay : .normal)
        }
    }
    
    private var backgroundLayer: some View {
        EmptyView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Material.ultraThin)
            .mask {
                Rectangle()
                    .cornerRadius(34, corners: [.topLeft, .topRight])
            }
            .strokeStyle(cornerRadius: 34, corners: [.topLeft, .topRight])
            .ignoresSafeArea()
    }
    
    private var backgroundCircleLayer: some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                ZStack {
                    if selection == item {
                        Circle()
                            .fill(item.color)
                            .matchedGeometryEffect(id: "backgroundCircle", in: namespace)
                    } else {
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 8)
        .ignoresSafeArea(edges: .bottom)
    }
    
    private var selectedTabIndicator: some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                ZStack {
                    if selection == item {
                        RoundedRectangle(cornerRadius: 3, style: .continuous)
                            .fill(item.color)
                            .frame(width: 28, height: 5)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                            .opacity(selection == item ? 1.0 : 0.0)
                            .matchedGeometryEffect(id: "selectedTabIndicator", in: namespace)
                    } else {
                        EmptyView()
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .ignoresSafeArea()
        .padding(.horizontal, 8)
    }
}

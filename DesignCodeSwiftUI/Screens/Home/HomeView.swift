//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct HomeView: View {
    
    @State var hasScrolled: Bool = false
    
    var body: some View {
        ScrollView {
            GeometryReader { proxy in
                let scrollMinY = proxy.frame(in: .named("scroll")).minY
//                Text("\(scrollMinY)")
                Color.clear
                    .preference(key: ScrollPreferenceKey.self, value: scrollMinY)
            }
            .frame(height: 0)
            FeaturedItem()
            Color.clear
                .frame(height: 1000)
        }
        .coordinateSpace(name: "scroll")
        .safeAreaInset(edge: .top) {
            Color.clear
                .frame(height: 70)
        }
        .overlay(
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        )
        .onPreferenceChange(ScrollPreferenceKey.self) { scrollMinY in
            withAnimation(.easeInOut) {
                hasScrolled = scrollMinY < 0
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

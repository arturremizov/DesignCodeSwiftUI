//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            FeaturedItem()
            Color.clear
                .frame(height: 1000)
        }
        .safeAreaInset(edge: .top) {
            Color.clear
                .frame(height: 70)
        }
        .overlay(NavigationBar(title: "Featured"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

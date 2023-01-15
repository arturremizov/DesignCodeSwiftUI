//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var hasScrolled: Bool = false
    
    private let courses: [Course] = [
        Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 5", logo: "Logo 2"),
        Course(title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animations and ...", image: "Illustration 3", logo: "Logo 4"),
        Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", logo: "Logo 1"),
        Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", logo: "Logo 3")
    ]
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                featuredLayer
                
                Color.clear
                    .frame(height: 1000)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 70)
            }
            .overlay(NavigationBar(title: "Featured", hasScrolled: $hasScrolled))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension HomeView {
    
    private var scrollDetection: some View {
        GeometryReader { proxy in
            let scrollMinY = proxy.frame(in: .named("scroll")).minY
//                Text("\(scrollMinY)")
            Color.clear
                .preference(key: ScrollPreferenceKey.self, value: scrollMinY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKey.self) { scrollMinY in
            withAnimation(.easeInOut) {
                hasScrolled = scrollMinY < 0
            }
        }
    }
    
    private var featuredLayer: some View {
        TabView {
            ForEach(courses) { item in
                GeometryReader { proxy in
                    
                    let minX = proxy.frame(in: .global).minX
                    
                    FeaturedItem(course: item)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / -10),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, y: 10)
                        .blur(radius: abs(minX) / 40)
                        .overlay {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 420)
        .background(
            Image("Blob 1")
                .offset(x: 250, y:-100)
        )
    }
}

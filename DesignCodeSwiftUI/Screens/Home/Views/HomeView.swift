//
//  HomeView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var hasScrolled: Bool = false
    @Namespace private var namespace
    @State private var showCourseDetail: Bool = false
    @State private var selectedCourse: Course? = nil
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                featuredLayer
                courseViewHeader
                coursesLayer
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 70)
            }
            .overlay(NavigationBar(title: "Featured", hasScrolled: $hasScrolled))
            
            if let selectedCourse, showCourseDetail {
                CourseDetailView(
                    course:selectedCourse,
                    namespace: namespace,
                    show: $showCourseDetail
                )
                .zIndex(1)
                .transition(
                    .asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))
                    )
                )
            }
        }
        .statusBarHidden(showCourseDetail)
        .tabBarHidden(showCourseDetail)
        .onChange(of: showCourseDetail) { newValue in
            if !newValue {
                selectedCourse = nil
            }
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
            ForEach(viewModel.featuredCourses) { item in
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
    
    private var courseViewHeader: some View {
        Text("Courses".uppercased())
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
    
    private var coursesLayer: some View {
        ForEach(viewModel.courses) { item in
            CourseView(course: item, namespace: namespace, show: $showCourseDetail)
                .opacity(selectedCourse == item && showCourseDetail ? 0 : 1)
                .onTapGesture {
                    withAnimation(.showCard) {
                        selectedCourse = item
                        showCourseDetail.toggle()
                    }
            }
        }
    }
}

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
    @State private var showSignUpView: Bool = false
    @State private var selectedFeaturedCourse: Course? = nil

    @StateObject private var viewModel = HomeViewModel()
    @AppStorage("isLiteMode") private var isLiteMode: Bool = true
    
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
            .overlay(navigationBar)
            
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
            
            if showSignUpView {
                SignUpView(show: $showSignUpView, type: .signIn)
                    .zIndex(1)
                    .accessibilityAddTraits(.isModal)
            }
        }
        .statusBarHidden(showCourseDetail)
        .tabBarHidden(showCourseDetail || showSignUpView)
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
    
    private var navigationBar: some View {
        NavigationBar(
            title: "Featured",
            hasScrolled: $hasScrolled,
            trailingButtons: {
                SearchButton(courses: viewModel.courses)
                AccountButton(showSignUpView: $showSignUpView)
            }
        )
    }
    
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
                        .shadow(color: Color("ShadowColor").opacity(isLiteMode ? 0 : 0.3), radius: 5, y: 3)
                        .blur(radius: abs(minX) / 40)
                        .overlay {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 230)
                                .offset(x: 32, y: -80)
                                .offset(x: minX / 2)
                        }
                        .onTapGesture {
                            selectedFeaturedCourse = item
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 420)
        .background(
            Image("Blob 1")
                .offset(x: 250, y:-100)
                .accessibilityHidden(true)
        )
        .sheet(item: $selectedFeaturedCourse) { course in
            CourseDetailView(course: course, namespace: namespace, show: .constant(true))
        }
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
            if !showCourseDetail {
                ForEach(viewModel.courses) { item in
                    CourseView(course: item, namespace: namespace, show: $showCourseDetail)
                        .onTapGesture {
                            withAnimation(.showCard) {
                                selectedCourse = item
                                showCourseDetail.toggle()
                            }
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityAddTraits(.isButton)
                }
            } else {
                ForEach(viewModel.courses) { item in
                    Rectangle()
                        .fill(.white)
                        .frame(height: 300)
                        .cornerRadius(30)
                        .shadow(color: Color("ShadowColor"), radius: 20, y: 10)
                        .opacity(0.3)
                        .padding(.horizontal, 30)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

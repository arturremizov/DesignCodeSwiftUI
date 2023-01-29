//
//  ExploreView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showSearch: Bool = false
    @AppStorage("isLogged") private var isLogged: Bool = false
    @State private var showSignUpView: Bool = false
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            coursesSection
                .safeAreaInset(edge: .top, content: {
                    Color.clear
                        .frame(height: 70)
                })
                .overlay {
                    NavigationBar(title: "Recent", hasScrolled: .constant(true)) {
                        SearchButton(showSearch: $showSearch, courses: [])
                        AccountButton(isLogged: $isLogged, showSignUpView: $showSignUpView)
                    }
                }
                .background(
                    Image("Blob 1")
                        .offset(x: -100, y: -400)
                )
            
            if showSignUpView {
                SignUpView(show: $showSignUpView, type: .signIn)
                    .zIndex(1)
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

extension ExploreView {
    
    private var coursesSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16.0) {
                ForEach(viewModel.courses) { course in
                    SmallCourseItem(course: course)
                }
            }
            .padding(.horizontal, 20)
            Spacer()
        }
    }
}

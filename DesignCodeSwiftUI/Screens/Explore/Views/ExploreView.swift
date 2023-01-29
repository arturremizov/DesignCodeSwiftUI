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
    
    @StateObject private var viewModel: ExploreViewModel = ExploreViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                coursesSection
                
                Text("Topics".uppercased())
                    .sectionTitleStyle()
                topicsSection
                
                Text("Popular".uppercased())
                    .sectionTitleStyle()
                handbooksSection
            }
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
    
    private var handbooksSection: some View {
        HStack(alignment: .top, spacing: 16.0) {
            ForEach(viewModel.handbooks) {
                HandbookItem(handbook: $0)
            }
        }
        .padding(.horizontal, 20)
    }
    
    private var topicsSection: some View {
        VStack {
            ForEach(viewModel.topics) {
                ListRow(topic: $0)
            }
        }
        .padding(20)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
        .strokeStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
}

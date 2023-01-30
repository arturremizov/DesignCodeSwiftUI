//
//  LibraryView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct LibraryView: View {
    
    enum LibraryType {
        case explore
        case library
    }
    
    @State private var showSignUpView: Bool = false
    @StateObject private var viewModel: LibraryViewModel = LibraryViewModel()
    
    let type: LibraryType
    
    private var title: String {
        switch type {
        case .explore:
            return "Recent"
        case .library:
            return "Library"
        }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                coursesSection
                
                Text("Topics".uppercased())
                    .sectionTitleStyle()
                topicsSection
                
                Group {
                    switch type {
                    case .explore:
                        Text("Popular".uppercased())
                            .sectionTitleStyle()
                        handbooksSection
                    case .library:
                        Text("Certificates".uppercased())
                            .sectionTitleStyle()
                        certificatesSection
                    }
                }
                .padding(.bottom, 40)
            }
            .safeAreaInset(edge: .top, content: {
                Color.clear
                    .frame(height: 70)
            })
            .overlay {
                NavigationBar(title: title, hasScrolled: .constant(true)) {
                    SearchButton(courses: viewModel.courses)
                    AccountButton(showSignUpView: $showSignUpView)
                }
            }
            .background(
                Image("Blob 1")
                    .offset(x: -100, y: -400)
                    .accessibilityHidden(true)
            )

            
            if showSignUpView {
                SignUpView(show: $showSignUpView, type: .signIn)
                    .zIndex(1)
                    .accessibilityAddTraits(.isModal)
            }
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(type: .library)
    }
}

extension LibraryView {
    
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
    
    private var certificatesSection: some View {
        CertificateView()
            .frame(height: 220)
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(
                        colors: [.purple, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .padding(20)
                    .offset(y: -30)
            }
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(LinearGradient(
                        colors: [.teal, .blue],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .padding(40)
                    .offset(y: -60)
            }
            .padding(.horizontal, 20)
    }
}

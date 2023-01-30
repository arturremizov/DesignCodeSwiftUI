//
//  NotificationsView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 30.01.23.
//

import SwiftUI

struct NotificationsView: View {
    
    @StateObject private var viewModel: NotificationsViewModel = NotificationsViewModel()
    @State private var showSignUpView: Bool = false

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            ScrollView {
                contentLayer
            }
            .safeAreaInset(edge: .top, content: {
                NavigationBar(title: "Notifications", hasScrolled: .constant(true)) {
                    SearchButton(courses: viewModel.courses)
                    AccountButton(showSignUpView: $showSignUpView)
                }
                .frame(height: 70)
            })
            .background(
                Image("Blob 1")
                    .offset(x: -180, y: 300)
            )
            
            if showSignUpView {
                SignUpView(show: $showSignUpView, type: .signIn)
                    .zIndex(1)
                    .accessibilityAddTraits(.isModal)
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

extension NotificationsView {
    
    private var contentLayer: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.courseSections) { section in
                if viewModel.courseSections.first != section {
                    Divider()
                }
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

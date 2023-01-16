//
//  CourseDetailView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct CourseDetailView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    @State private var showDivider: Bool = false
    @State private var showAuthor: Bool = false
    @State private var showContent: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                headerLayer
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(showContent ? 1 : 0)
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea()
            .onChange(of: show) { _ in
                showDivider = false
                showAuthor = false
                showContent = false
            }

            closeButton
        }
        .onAppear(perform: fadeInViews)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetailView(namespace: namespace, show: .constant(true))
    }
}

extension CourseDetailView {
    
    private var headerLayer: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.black)
        .background(
            Image("Illustration 9")
                .resizable()
                .scaledToFit()
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("Background 5")
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .overlay {
            VStack(alignment: .leading, spacing: 12) {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .bold()
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Second Text".uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                Text("Third Description Text")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "description", in: namespace)
              
                Divider()
                    .opacity(showDivider ? 1 : 0)
                
                HStack {
                    Image("Avatar Default")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(
                            .ultraThinMaterial,
                            in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                        )
                        .strokeStyle(cornerRadius: 18)
                    Text("Taught by Meng To")
                        .font(.footnote)
                }
                .opacity(showAuthor ? 1 : 0)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .matchedGeometryEffect(id: "backgroundBlur", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
        }
    }
    
    private var closeButton: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body)
                .bold()
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
    }
}

extension CourseDetailView {
    
    private func fadeInViews() {
        withAnimation(.easeOut.delay(0.3)) {
            showDivider = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            showAuthor = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            showContent = true
        }
    }
}

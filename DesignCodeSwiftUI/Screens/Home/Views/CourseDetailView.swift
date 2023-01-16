//
//  CourseDetailView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct CourseDetailView: View {
    
    let course: Course
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    @State private var showDivider: Bool = false
    @State private var showAuthor: Bool = false
    @State private var showContent: Bool = false
    
    @State private var viewState: CGSize = .zero
    @State private var isDraggable: Bool = true
    
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
            .mask {
                RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous)
            }
            .shadow(color: .black.opacity(0.3), radius: 30, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? dragGesture : nil)
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
        CourseDetailView(course: dev.course, namespace: namespace, show: .constant(true))
    }
}

extension CourseDetailView {
    
    private var headerLayer: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                courseImage
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                headerBackgroundImage
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask {
                headerMask
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            }
            .overlay {
                courseInfoCard
                    .offset(y: 250)
                    .padding(20)
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            }
        }
        .frame(height: 500)
    }
    
    private var courseImage: some View {
        Image(course.image)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "image-\(course.id)", in: namespace)
    }
    
    private var headerBackgroundImage: some View {
        Image(course.background)
            .resizable()
            .scaledToFill()
            .matchedGeometryEffect(id: "background-\(course.id)", in: namespace)
    }
    
    private var headerMask: some View {
        RoundedRectangle(cornerRadius: 30, style: .continuous)
            .matchedGeometryEffect(id: "mask-\(course.id)", in: namespace)
    }
    
    private var courseInfoCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle)
                .bold()
                .matchedGeometryEffect(id: "title-\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(course.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .matchedGeometryEffect(id: "subtitle-\(course.id)", in: namespace)
            
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "description-\(course.id)", in: namespace)
          
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
                .matchedGeometryEffect(id: "backgroundBlur-\(course.id)", in: namespace)
        )
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
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard
                    value.translation.width > 0,
                    value.startLocation.x < 20
                else { return }
                withAnimation(.closeCard) {
                    viewState = value.translation
                }
                if viewState.width > 120 {
                    close(at: 120)
                }
            }
            .onEnded { value in
                close(at: 80)
            }
    }
    
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
    
    private func close(at dragWidth: CGFloat) {
        if viewState.width > dragWidth {
            withAnimation(.closeCard.delay(0.3)) {
                show.toggle()
            }
        }
        withAnimation(.closeCard) {
            viewState = .zero
        }
        isDraggable = false
    }
}

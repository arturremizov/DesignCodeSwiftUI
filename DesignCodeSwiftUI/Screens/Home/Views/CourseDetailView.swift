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
    
    @State private var selectedCourseSection: CourseSection? = nil
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel: CourseDetailViewModel = CourseDetailViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                headerLayer
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(showContent ? 1 : 0)
            }
            .coordinateSpace(name: "scrollView")
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

            CloseButton {
                withAnimation(.closeCard) {
                    show.toggle()
                    dismiss()
                }
            }
            .ignoresSafeArea()
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
            let scrollY = proxy.frame(in: .named("scrollView")).minY
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
            .padding(20)
            .frame(maxWidth: 500)
            .matchedGeometryEffect(id: "image-\(course.id)", in: namespace)
    }
    
    private var headerBackgroundImage: some View {
        Image(course.background)
            .resizable()
            .scaledToFill()
            .matchedGeometryEffect(id: "background-\(course.id)", in: namespace)
    }
    
    private var headerMask: some View {
        RoundedRectangle(cornerRadius: show ? 0 : 30, style: .continuous)
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
    
    private var content: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.courseSections) { section in
                if viewModel.courseSections.first != section {
                    Divider()
                }
                SectionRow(section: section)
                    .onTapGesture {
                        selectedCourseSection = section
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(item: $selectedCourseSection) { section in
            SectionView(section: section)
        }
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

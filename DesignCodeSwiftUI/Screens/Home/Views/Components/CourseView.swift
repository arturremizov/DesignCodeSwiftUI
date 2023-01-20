//
//  CourseView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct CourseView: View {
    
    let course: Course
    var namespace: Namespace.ID
    @Binding var show: Bool

    var body: some View {
        VStack {
            Spacer()
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
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "backgroundBlur-\(course.id)", in: namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image(course.image)
                .resizable()
                .scaledToFit()
                .padding(20)
                .matchedGeometryEffect(id: "image-\(course.id)", in: namespace)
        )
        .background(
            Image(course.background)
                .resizable()
                .scaledToFill()
                .matchedGeometryEffect(id: "background-\(course.id)", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask-\(course.id)", in: namespace)
        }
        .frame(height: 300)
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(course: dev.course, namespace: namespace, show: .constant(true))
    }
}

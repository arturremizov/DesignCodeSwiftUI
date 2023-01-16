//
//  CourseView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct CourseView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool

    var body: some View {
        VStack {
            Spacer()
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
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "backgroundBlur", in: namespace)
            )
        }
        .foregroundStyle(.white)
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
        .frame(height: 300)
        .padding(20)
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}

//
//  FeaturedItem.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct FeaturedItem: View {
    
    let course: Course
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Spacer()
            logo
            title
            subtitle
            descriptionLayer
        }
        .padding(20)
        .padding(.vertical, 20)
        .frame(height: 350)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 30, style: .continuous)
        )
//        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color("ShadowColor").opacity(0.3), radius: 10, y: 10)
        .strokeStyle()
        .padding(.horizontal, 20)
        .overlay(itemImage)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        let course = Course(title: "SwiftUI for iOS 15",
                            subtitle: "20 sections - 3 hours",
                            text: "Build an iOS app for iOS 15 with custom layouts, animations and ...",
                            image: "Illustration 5",
                            logo: "Logo 2")
        FeaturedItem(course: course)
    }
}

extension FeaturedItem {
    
    private var logo: some View {
        Image(course.logo)
            .resizable()
            .scaledToFit()
            .frame(width: 26, height: 26)
            .mask(Circle())
            .padding(9)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .strokeStyle(cornerRadius: 16)
    }
    
    private var title: some View {
        Text(course.title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    private var subtitle: some View {
        Text(course.subtitle.uppercased())
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
    }
    
    private var descriptionLayer: some View {
        Text(course.text)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)
    }
    
    private var itemImage: some View {
        Image(course.image)
            .resizable()
            .scaledToFit()
            .frame(height: 230)
            .offset(x: 32, y: -80)
    }
}

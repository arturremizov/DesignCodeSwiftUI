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
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle()
        .padding(.horizontal, 20)
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem(course: dev.course)
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
                Color(uiColor: .systemBackground).opacity(0.1),
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .strokeStyle(cornerRadius: 16)
    }
    
    private var title: some View {
        Text(course.title)
            .lineLimit(1)
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
}

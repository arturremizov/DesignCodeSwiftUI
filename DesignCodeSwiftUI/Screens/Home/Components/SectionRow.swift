//
//  SectionRow.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct SectionRow: View {
    let section: CourseSection
    var body: some View {
        HStack(alignment: .top, spacing: 16.0) {
            Image(section.logo)
                .resizable()
                .frame(width: 36, height: 36)
                .mask(Circle())
                .padding(12)
                .background(Color(uiColor: .systemBackground).opacity(0.3))
                .mask(Circle())
                .overlay(CircularView(value: section.progress))
            VStack(alignment: .leading, spacing: 8.0) {
                Text(section.subtitle)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                Text(section.title)
                    .fontWeight(.semibold)
                Text(section.text)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                ProgressView(value: section.progress)
                    .tint(.white)
                    .frame(maxWidth: 132)
            }
        }
        .padding(20)
    }
}

struct SectionRow_Previews: PreviewProvider {
    
    static var previews: some View {
        SectionRow(section: dev.courseSection)
    }
}

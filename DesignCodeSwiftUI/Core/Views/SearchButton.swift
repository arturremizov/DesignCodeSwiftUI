//
//  SearchButton.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct SearchButton: View {
    
    @State var showSearch: Bool = false
    let courses: [Course]
    
    var body: some View {
        Button {
            showSearch = true
        } label: {
            Image(systemName: "magnifyingglass")
                .font(.body)
                .bold()
                .frame(width: 36, height: 36)
                .foregroundColor(.secondary)
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                )
                .strokeStyle(cornerRadius: 14)
        }
        .sheet(isPresented: $showSearch) {
            SearchView(courses: courses)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(courses: Array(repeating: dev.course, count: 5))
    }
}

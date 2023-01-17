//
//  SearchView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 17.01.23.
//

import SwiftUI

struct SearchView: View {
    
    @State var text: String = ""
    let courses: [Course]
    @Environment(\.dismiss) var dismiss
    
    private var filteredCourses: [Course] {
        courses.filter { $0.title.lowercased().contains(text.lowercased()) || text == "" }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredCourses) { item in
                Text(item.title)
            }
            .searchable(
                text: $text,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "SwiftUI, React, UI Design"
            )
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                            .bold()
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(courses: [dev.course])
    }
}

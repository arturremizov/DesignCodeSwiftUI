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
    @State private var selectedCourse: Course? = nil
    @State private var showCourseDetail: Bool = false
    @Namespace private var namespace
    
    private let suggestions: [CourseSuggestion] = [
        CourseSuggestion(title: "SwiftUI"),
        CourseSuggestion(title: "React"),
        CourseSuggestion(title: "Design")

    ]
    
    private var filteredCourses: [Course] {
        courses.filter { $0.title.lowercased().contains(text.lowercased()) || text == "" }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                VStack {
                    contentLayer
                }
                .padding(20)
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 30, style: .continuous)
                )
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1")
                        .offset(x: -100, y: -200)
                )
            }
            .searchable(
                text: $text,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: "SwiftUI, React, UI Design"
            )
            .searchSuggestions { suggestionsLayer }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { doneButton }
            .sheet(item: $selectedCourse, content: { selectedCourse in
                CourseDetailView(course: selectedCourse, namespace: namespace, show: $showCourseDetail)
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(courses: Array(repeating: dev.course, count: 4))
    }
}

extension SearchView {
    
    private var contentLayer: some View {
        ForEach(Array(filteredCourses.enumerated()), id: \.offset) { index, item in
            
            if index != 0 {
                Divider()
            }
            
            Button {
                selectedCourse = item
            } label: {
                HStack(alignment: .top, spacing: 12.0) {
                    Image(item.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .background(Color("BackgroundColor"))
                        .mask(Circle())
                    
                    VStack(alignment: .leading, spacing: 4.0) {
                        Text(item.title)
                            .bold()
                            .foregroundColor(.primary)
                        Text(item.text)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.vertical, 4)
                .listRowSeparator(.hidden)
            }
        }
    }
    
    private var suggestionsLayer: some View {
        ForEach(suggestions) { item in
            Text(item.title)
                .searchCompletion(item.title)
        }
    }
    
    private var doneButton: ToolbarItem<(), Button<Text>> {
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

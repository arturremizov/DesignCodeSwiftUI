//
//  CourseDetailViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import Foundation

class CourseDetailViewModel: ObservableObject {
    
    @Published var courseSections: [CourseSection] = []
    
    init() {
        getCourseSections()
    }
    
    private func getCourseSections() {
        courseSections = [
            CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
            CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
            CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
            CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
            CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
            CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
            CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
            CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
            CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
            CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
        ]
    }
}

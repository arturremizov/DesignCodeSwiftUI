//
//  ExploreViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var courses: [Course] = []
    @Published var handbooks: [Handbook] = []
    @Published var topics: [Topic] = []
    
    init() {
        getCourses()
        getHandbooks()
        getTopics()
    }
    
    private func getCourses() {
        courses = [
            Course(index: 1,
                   title: "SwiftUI for iOS 15",
                   subtitle: "20 sections - 3 hours",
                   text: "Build an iOS app for iOS 15 with custom layouts, animations and ...",
                   image: "Illustration 5",
                   background: "Background 5",
                   logo: "Logo 2"),
            
            Course(index: 2,
                   title: "UI Design for iOS 15",
                   subtitle: "20 sections - 3 hours",
                   text: "Design an iOS app for iOS 15 with custom layouts, animations and ...",
                   image: "Illustration 3",
                   background: "Background 4",
                   logo: "Logo 4"),
            
            Course(index: 3,
                   title: "Flutter for designers",
                   subtitle: "20 sections - 3 hours",
                   text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.",
                   image: "Illustration 1",
                   background: "Background 1",
                   logo: "Logo 1"),
            
            Course(index: 4,
                   title: "React Hooks Advanced",
                   subtitle: "20 sections - 3 hours",
                   text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud",
                   image: "Illustration 2",
                   background: "Background 2",
                   logo: "Logo 3")
        ]
    }
    
    private func getHandbooks() {
        handbooks = [
            Handbook(title: "SwiftUI Handbook",
                     subtitle: "80 sections - 9 hours",
                     text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development techniques",
                     logo: "Logo 1",
                     image: "Illustration 1",
                     color1: .teal,
                     color2: .blue),
            
            Handbook(title: "React Handbook",
                     subtitle: "30 sections - 3 hours",
                     text: "A comprehensive guide for an overview of the React library and all its basics",
                     logo: "Logo 1",
                     image: "Illustration 2",
                     color1: .purple,
                     color2: .pink)
        ]
    }
    
    private func getTopics() {
        topics = [
            Topic(title: "iOS Development", icon: "iphone"),
            Topic(title: "UI Design", icon: "eyedropper"),
            Topic(title: "Web development", icon: "laptopcomputer")
        ]

    }
}

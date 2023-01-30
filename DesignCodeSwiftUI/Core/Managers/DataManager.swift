//
//  DataManager.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 30.01.23.
//

import SwiftUI

struct DataManager {
    
    static func getFeaturedCourses() -> [Course] {
        [
            Course(index: 1,
                   title: "SwiftUI for iOS 15",
                   subtitle: "20 sections - 3 hours",
                   text: "Build an iOS app for iOS 15 with custom layouts, animations and ...",
                   image: "Illustration 9",
                   background: "Background 5",
                   logo: "Logo 2"),
               
            Course(index: 2,
                   title: "React Hooks Advanced",
                   subtitle: "20 sections - 3 hours",
                   text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud",
                   image: "Illustration 2",
                   background: "Background 3",
                   logo: "Logo 3"),
                
            Course(index: 3,
                   title: "UI Design for iOS 15",
                   subtitle: "20 sections - 3 hours",
                   text: "Design an iOS app for iOS 15 with custom layouts, animations and ...",
                   image: "Illustration 3",
                   background: "Background 4",
                   logo: "Logo 4"),
               
            Course(index: 4,
                   title: "Flutter for designers",
                   subtitle: "20 sections - 3 hours",
                   text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.",
                   image: "Illustration 1",
                   background: "Background 1",
                   logo: "Logo 1")
        ]
    }
    
    static func getCourses() -> [Course]  {
        [
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
    
    static func getCourseSections() -> [CourseSection] {
        [
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
    
    static func getHandbooks() -> [Handbook] {
        [
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
    
    static func getTopics() -> [Topic] {
        [
            Topic(title: "iOS Development", icon: "iphone"),
            Topic(title: "UI Design", icon: "eyedropper"),
            Topic(title: "Web development", icon: "laptopcomputer")
        ]

    }
}



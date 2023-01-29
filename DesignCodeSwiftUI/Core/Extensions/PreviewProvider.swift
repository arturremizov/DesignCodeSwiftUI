//
//  PreviewProvider.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 16.01.23.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let course = Course(index: 1,
                        title: "SwiftUI for iOS 15",
                        subtitle: "20 sections - 3 hours",
                        text: "Build an iOS app for iOS 15 with custom layouts, animations and ...",
                        image: "Illustration 9",
                        background: "Background 5",
                        logo: "Logo 2")
    
    let courseSection = CourseSection(title: "Advanced Custom Layout",
                                      subtitle: "SwiftUI for iOS 15",
                                      text: "Build an iOS app for iOS 15 with custom layouts...",
                                      image: "Illustration 1",
                                      background: "Background 5",
                                      logo: "Logo 2",
                                      progress: 0.5)
    
    let handbook = Handbook(title: "SwiftUI Handbook",
                            subtitle: "80 sections - 9 hours",
                            text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development techniques",
                            logo: "Logo 1",
                            image: "Illustration 1",
                            color1: .teal,
                            color2: .blue)
    
    let topic = Topic(title: "iOS Development", icon: "iphone")

}

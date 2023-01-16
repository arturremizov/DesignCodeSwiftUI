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
}

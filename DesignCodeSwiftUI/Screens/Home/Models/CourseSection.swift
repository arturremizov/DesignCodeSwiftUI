//
//  CourseSection.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 28.01.23.
//

import Foundation

struct CourseSection: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}

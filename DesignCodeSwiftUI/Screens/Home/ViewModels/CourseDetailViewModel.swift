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
        courseSections = DataManager.getCourseSections()
    }
}

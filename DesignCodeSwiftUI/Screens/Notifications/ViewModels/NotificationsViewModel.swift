//
//  NotificationsViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 30.01.23.
//

import SwiftUI

class NotificationsViewModel: ObservableObject {
    
    @Published var courseSections: [CourseSection] = []
    @Published var courses: [Course] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        courseSections = DataManager.getCourseSections()
        courses = DataManager.getCourses()
    }
}

//
//  HomeViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 16.01.23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var featuredCourses: [Course] = []
    @Published var courses: [Course] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        featuredCourses = DataManager.getFeaturedCourses()
        courses = DataManager.getCourses()
    }
}

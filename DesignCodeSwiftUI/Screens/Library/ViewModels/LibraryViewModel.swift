//
//  LibraryViewModel.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import Foundation

class LibraryViewModel: ObservableObject {
    
    @Published var courses: [Course] = []
    @Published var handbooks: [Handbook] = []
    @Published var topics: [Topic] = []
    
    init() {
        getData()
    }
    
    private func getData() {
        courses = DataManager.getCourses()
        handbooks = DataManager.getHandbooks()
        topics = DataManager.getTopics()
    }
}

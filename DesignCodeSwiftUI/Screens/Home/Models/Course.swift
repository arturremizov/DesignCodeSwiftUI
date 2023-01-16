//
//  Course.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct Course: Identifiable, Equatable {
    let id: UUID = UUID()
    let index: Int
    let title: String
    let subtitle: String
    let text: String
    let image: String
    let background: String
    let logo: String
}


//
//  Course.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct Course: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subtitle: String
    let text: String
    let image: String
    let logo: String
}


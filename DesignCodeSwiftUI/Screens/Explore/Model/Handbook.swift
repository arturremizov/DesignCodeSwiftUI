//
//  Handbook.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct Handbook: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var logo: String
    var image: String
    var color1: Color
    var color2: Color
}

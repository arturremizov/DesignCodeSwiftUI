//
//  Coin.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 26.01.23.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: Int
    let coinName: String
    let acronym: String
    let logo: String
}

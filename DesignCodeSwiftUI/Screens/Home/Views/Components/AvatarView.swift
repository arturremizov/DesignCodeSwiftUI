//
//  AvatarView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 22.01.23.
//

import SwiftUI

struct AvatarView: View {
    
    private let urlString = "https://picsum.photos/200"
    
    var body: some View {
        AsyncImage(url: URL(string: urlString), transaction: Transaction(animation: .easeOut)) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .transition(.scale(scale: 0.5, anchor: .center))
            case .empty:
                ProgressView()
            case .failure:
                Color.gray
            default:
                EmptyView()
            }
        }
        .frame(width: 26, height: 26)
        .cornerRadius(10)
        .padding(8)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 18, style: .continuous)
        )
        .strokeStyle(cornerRadius: 18)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView()
    }
}

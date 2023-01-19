//
//  CloseButton.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI

struct CloseButton: View {
    
    let action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .font(.body)
                .bold()
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton { }
    }
}


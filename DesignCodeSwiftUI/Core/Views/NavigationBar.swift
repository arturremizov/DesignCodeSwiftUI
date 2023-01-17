//
//  NavigationBar.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct NavigationBar<Content: View>: View {
    
    let title: String
    @Binding var hasScrolled: Bool
    let trailingButtons: Content
    
    init(title: String,
         hasScrolled: Binding<Bool>,
         @ViewBuilder trailingButtons: () -> Content) {
        self.title = title
        self._hasScrolled = hasScrolled
        self.trailingButtons = trailingButtons()
    }
    
    var body: some View {
        ZStack {
            backgroundLayer
            titleLayer
            
            HStack(spacing: 16.0) {
               trailingButtons
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 20)
            .padding(.top, 20)
            .offset(y: hasScrolled ? -4 : 0)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "Title", hasScrolled: .constant(false)) {
            Image(systemName: "magnifyingglass")
                .font(.body)
                .bold()
                .frame(width: 36, height: 36)
                .foregroundColor(.secondary)
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                )
                .strokeStyle(cornerRadius: 14)
        }
    }
}


extension NavigationBar {
    
    private var backgroundLayer: some View {
        Color.clear
            .background(.ultraThinMaterial)
            .blur(radius: 10)
            .opacity(hasScrolled ? 1 : 0)
    }
    
    private var titleLayer: some View {
        Text(title)
            .animatableFont(size: hasScrolled ? 22 : 34)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .padding(.top, 20)
    }
}

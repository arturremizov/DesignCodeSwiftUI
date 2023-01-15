//
//  AnimatableFontModifier.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI
 
struct AnimatableFontModifier: ViewModifier, Animatable {
    
    var size: CGFloat
    
    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size))
    }
}

extension View {
    
    func animatableFont(size: CGFloat) -> some View {
        modifier(AnimatableFontModifier(size: size))
    }
}

//
//  SignUpView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI

struct SignUpView: View {
    
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.regularMaterial)
                .ignoresSafeArea()
            
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                Text("Access 120+ hours of courses, tutorials and livestreams")
                    .font(.headline)
                
                Button {
                    
                } label: {
                    Text("Create an account")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .blendMode(.overlay)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
            }
            .padding(20)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .strokeStyle(cornerRadius: 30)
            .shadow(
                color: Color("ShadowColor").opacity(0.2),
                radius: 30,
                x: 0,
                y: 30
            )
            .padding(20)
            .background(
                Image("Blob 1")
                    .offset(x: 200, y: -100)
            )
            
            CloseButton {
                withAnimation {
                    show = false
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(show: .constant(true))
    }
}

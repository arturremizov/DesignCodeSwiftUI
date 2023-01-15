//
//  MatchedView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct MatchedView: View {
    
    @Namespace var namespace
    @State var show: Bool = false
    
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Hello, World!")
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Second Text")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("Third Description Text")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "description", in: namespace)

                }
                .padding(20)
                .foregroundStyle(.white)
                .background(
                    Color.red
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .padding(20)

            } else {
                VStack(alignment: .leading, spacing: 20.0) {
                    Spacer()
                    Text("Third Description Text")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "description", in: namespace)

                    Text("Second Text")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                    Text("Hello, World!")
                        .font(.largeTitle)
                        .bold()
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(20)
                .foregroundStyle(.black)
                .background(
                    Color.blue
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
            }
        }
        
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
            }
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}

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
                VStack {
                    Spacer()
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
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                            .blur(radius: 30)
                            .matchedGeometryEffect(id: "backgroundBlur", in: namespace)
                    )
                }
                .foregroundStyle(.white)
                .background(
                    Image("Illustration 9")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image("Background 5")
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask {
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                }
                .frame(height: 300)
                .padding(20)

            } else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 500)
                    .foregroundStyle(.black)
                    .background(
                        Image("Illustration 9")
                            .resizable()
                            .scaledToFit()
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .background(
                        Image("Background 5")
                            .resizable()
                            .scaledToFill()
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    }
                    .overlay {
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
                          
                            Divider()
                            
                            HStack {
                                Image("Avatar Default")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .cornerRadius(10)
                                    .padding(8)
                                    .background(
                                        .ultraThinMaterial,
                                        in: RoundedRectangle(cornerRadius: 18, style: .continuous)
                                    )
                                    .strokeStyle(cornerRadius: 18)
                                Text("Taught by Meng To")
                            }
                        }
                        .padding(20)
                        .background(
                            Rectangle()
                                .fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .matchedGeometryEffect(id: "backgroundBlur", in: namespace)
                        )
                        .offset(y: 250)
                        .padding(20)
                    }
                }
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

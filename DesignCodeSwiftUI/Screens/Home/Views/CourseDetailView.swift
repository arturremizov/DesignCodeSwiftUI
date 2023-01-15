//
//  CourseDetailView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 15.01.23.
//

import SwiftUI

struct CourseDetailView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                headerLayer
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea()

            closeButton
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetailView(namespace: namespace, show: .constant(true))
    }
}

extension CourseDetailView {
    
    private var headerLayer: some View {
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
    
    private var closeButton: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body)
                .bold()
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
}

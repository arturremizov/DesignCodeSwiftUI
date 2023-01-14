//
//  AccountView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 8.01.23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        Canvas { context, size in
            context.draw(
                Text("DesignCode")
                    .font(.largeTitle),
                in: CGRect(x: 0, y: 0, width: 0, height: 0)
            )
            
            context.fill(
                Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)),
                with: .color(.pink)
            )
            
            context.draw(
                Image("Blob 1"),
                in: CGRect(x: 0, y: 0, width: 200, height: 200)
            )
            
            context.draw(
                Image(systemName: "hexagon.fill"),
                in: CGRect(x: 0, y: 0, width: size.width, height: size.height)
            )
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(
            .linearGradient(
                colors: [.pink, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

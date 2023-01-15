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
                

            } else {
                
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

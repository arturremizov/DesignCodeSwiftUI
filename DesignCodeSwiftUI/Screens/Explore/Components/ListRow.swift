//
//  ListRow.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct ListRow: View {
    
    let topic: Topic
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: topic.icon)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .mask(Circle())
            Text(topic.title)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(topic: dev.topic)
    }
}

//
//  AccountButton.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 29.01.23.
//

import SwiftUI

struct AccountButton: View {
    
    @Binding var isLogged: Bool
    @Binding var showSignUpView: Bool
    
    @State private var showAccount: Bool = false

    var body: some View {
        Button {
            if isLogged {
                showAccount = true
            } else {
                withAnimation {
                    showSignUpView = true
                }
            }
        } label: {
            AvatarView(isLogged: isLogged)
        }
        .sheet(isPresented: $showAccount) {
            AccountView()
        }
    }
}

struct AccountButton_Previews: PreviewProvider {
    static var previews: some View {
        AccountButton(isLogged: .constant(true), showSignUpView: .constant(false))
    }
}

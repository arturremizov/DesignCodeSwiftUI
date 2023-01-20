//
//  SignUpView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI

struct SignUpView: View {
    
    enum Field: Hashable {
        case email
        case password
    }
    
    @Binding var show: Bool
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State var circleY: CGFloat = 120
    
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
                
                emailTextField
                passwordField
                createAccountButton
                footerLayer
            }
            .padding(20)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .background(
                Circle()
                    .fill(.blue)
                    .frame(width: 68, height: 68)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(y: circleY)
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
            .onChange(of: focusedField) { newValue in
                withAnimation {
                    if newValue == .email {
                        circleY = 120
                    } else {
                        circleY = 190
                    }
                }
            }
            
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

extension SignUpView {
    
    private var emailTextField: some View {
        TextField("Email", text: $email)
            .inputStyle(iconName: "mail")
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .focused($focusedField, equals: .email)
            .shadow(
                color: focusedField == .email ? .primary.opacity(0.3) : .clear,
                radius: 10,
                y: 3
            )
    }
    
    private var passwordField: some View {
        SecureField("Password", text: $password)
            .inputStyle(iconName: "lock")
            .textContentType(.password)
            .focused($focusedField, equals: .password)
            .shadow(
                color: focusedField == .password ? .primary.opacity(0.3) : .clear,
                radius: 10,
                y: 3
            )
    }
    
    private var createAccountButton: some View {
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
    
    private var footerLayer: some View {
        Group {
            Text("By clicking on") +
            Text(" _Create an account_,")
                .foregroundColor(.primary.opacity(0.7)) +
            Text(" you agree to our **Terms of service** and **[Privacy policy](https://designcode.io)**.")
            
            Divider()
            
            HStack {
                Text("Already have an account?")
                Button {
                    
                } label: {
                    Text("**Sign in**")
                }
            }
        }
        .font(.footnote)
        .foregroundColor(.secondary)
        .tint(.secondary)
    }
}

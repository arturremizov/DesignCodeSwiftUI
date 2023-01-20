//
//  SignUpView.swift
//  DesignCodeSwiftUI
//
//  Created by Artur Remizov on 19.01.23.
//

import SwiftUI


struct SignUpView: View {
    
    enum SignType {
        case signUp
        case signIn
    }
    
    fileprivate enum Field: Hashable {
        case email
        case password
    }
    
    @Binding var show: Bool
    @State var type: SignType
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State private var circleY: CGFloat = 120
    @State private var emailY: CGFloat = 0
    @State private var passwordY: CGFloat = 0
    @State private var circleColor: Color = .blue

    private var titleText: String {
        type == .signUp ? "Sign up" : "Sign in"
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.regularMaterial)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text(titleText)
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
            .background(backgroundCircle)
            .coordinateSpace(name: "container")
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
                        circleY = emailY
                        circleColor = .blue
                    } else {
                        circleY = passwordY
                        circleColor = .red
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
        ZStack {
            SignUpView(show: .constant(true), type: .signIn)
        }
    }
}

extension SignUpView {
    
    private var geometryReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(
                    key: CirclePreferenceKey.self,
                    value: proxy.frame(in: .named("container")).minY
                )
        }
    }
    
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
            .overlay(geometryReader)
            .onPreferenceChange(CirclePreferenceKey.self) { value in
                emailY = value
                circleY = value
            }
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
            .overlay(geometryReader)
            .onPreferenceChange(CirclePreferenceKey.self) { value in
                passwordY = value
            }
    }
    
    private var backgroundCircle: some View {
        Circle()
            .fill(circleColor)
            .frame(width: 68, height: 68)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .offset(y: circleY)
    }
    
    private var createAccountButton: some View {
        Button {
            
        } label: {
            Text(type == .signUp ? "Create an account" : "Sign in")
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
            if type == .signUp {
                Text("By clicking on") +
                Text(" _Create an account_,")
                    .foregroundColor(.primary.opacity(0.7)) +
                Text(" you agree to our **Terms of service** and **[Privacy policy](https://designcode.io)**.")
            }
            
            Divider()
            
            HStack {
                Text(type == .signUp ? "Already have an account?" : "No account yet?")
                Button {
                    type = (type == .signUp) ? .signIn : .signUp
                } label: {
                    Text(type == .signUp ? "**Sign in**" : "**Sign up**")
                }
            }
        }
        .font(.footnote)
        .foregroundColor(.secondary)
        .tint(.secondary)
    }
}

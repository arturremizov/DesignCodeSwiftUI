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
    
    @AppStorage("isLogged") private var isLogged: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    @FocusState private var focusedField: Field?
    @State private var circleY: CGFloat = 120
    @State private var emailY: CGFloat = 0
    @State private var passwordY: CGFloat = 0
    @State private var circleColor: Color = .blue

    @State private var viewState: CGSize = .zero
    @State private var isDismissed: Bool = false
    
    @State private var isShowingContentContainer: Bool = false
    @State private var isShowingCloseButton: Bool = false
    @State private var isShowingBackgroundImage: Bool = false
    @State private var isShowingTitle: Bool = false
    @State private var isShowingSubtitle: Bool = false
    @State private var isShowingContent: Bool = false


    private var titleText: String {
        type == .signUp ? "Sign up" : "Sign in"
    }
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.regularMaterial)
                .onTapGesture {
                    dismiss()
                }
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text(titleText)
                    .font(.largeTitle)
                    .bold()
                    .opacity(isShowingTitle ? 1 : 0)
                    .offset(y: isShowingTitle ? 0 : 20)
                
                Text("Access 120+ hours of courses, tutorials and livestreams")
                    .font(.headline)
                    .opacity(isShowingSubtitle ? 1 : 0)
                    .offset(y: isShowingSubtitle ? 0 : 20)
                
                Group {
                    emailTextField
                    passwordField
                    createAccountButton
                    footerLayer
                }
                .opacity(isShowingContent ? 1 : 0)
                .offset(y: isShowingContent ? 0 : 20)
            }
            .padding(20)
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 30, style: .continuous)
            )
            .background(backgroundCircle)
            .coordinateSpace(name: "container")
            .strokeStyle(cornerRadius: 30)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(viewState)
            .offset(y: isDismissed ? 1000: 0)
            .rotationEffect(.degrees(viewState.width / 40))
            .rotation3DEffect(.degrees(viewState.height / 20), axis: (x: 1, y: 0, z: 0))
            .hueRotation(.degrees(viewState.width / 5))
            .gesture(dragGesture)
            .shadow(
                color: Color("ShadowColor").opacity(0.2),
                radius: 30,
                x: 0,
                y: 30
            )
            .opacity(isShowingContentContainer ? 1 : 0)
            .offset(y: isShowingContentContainer ? 0 : 200)
            .padding(20)
            .background(
                Image("Blob 1")
                    .offset(x: 200, y: -100)
                    .opacity(isShowingBackgroundImage ? 1 : 0)
                    .offset(y: isShowingBackgroundImage ? 0 : 10)
                    .blur(radius: isShowingBackgroundImage ? 0 : 40)
                    .allowsHitTesting(false)
                    .accessibilityHidden(true)
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
                dismiss()
            }
            .opacity(isShowingCloseButton ? 1 : 0)
            .offset(y: isShowingCloseButton ? 0 : -200)
        }
        .onAppear {
            withAnimation(.easeOut) {
                isShowingContentContainer = true
            }
            withAnimation(.easeOut.delay(0.1)) {
                isShowingCloseButton = true
            }
            withAnimation(.easeOut(duration: 1).delay(0.2)) {
                isShowingBackgroundImage = true
            }
            
            withAnimation(.spring().delay(0.1)) {
                isShowingTitle = true
            }
            withAnimation(.spring().delay(0.2)) {
                isShowingSubtitle = true
            }
            withAnimation(.spring().delay(0.3)) {
                isShowingContent = true
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
            isLogged = true
            dismiss()
        } label: {
            Text(type == .signUp ? "Create an account" : "Sign in")
                .frame(maxWidth: .infinity)
        }
        .font(.headline)
        .blendMode(.overlay)
        .buttonStyle(.angular)
        .tint(.accentColor)
        .controlSize(.large)
        .shadow(
            color: Color("ShadowColor").opacity(0.2),
            radius: 30,
            x: 0,
            y: 30
        )
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
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                viewState = value.translation
            }
            .onEnded { value in
                if value.translation.height > 200 {
                    dismiss()
                } else {
                    withAnimation(.showCard) {
                        viewState = .zero
                    }
                }
            }
    }
}

extension SignUpView {
    
    private func dismiss() {
        withAnimation {
            isDismissed = true
        }
        withAnimation(.linear.delay(0.3)) {
            show = false
        }
    }
}

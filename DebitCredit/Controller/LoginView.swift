//
//  LoginView.swift
//  DesignSwiftUI
//
//  Created by Thom Pheijffer on 18/06/2019.
//  Copyright © 2019 Thom Pheijffer. All rights reserved.
//

import SwiftUI
import LocalAuthentication
import UIKit

struct User {
    var name: String
    var password: String
}

struct LoginView : View {
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var username: String = ""
    
    @State private var isLoggingIn: Bool = false
    
    var body: some View {
        
        
        NavigationView {
            
            VStack {
                
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.title)
                    TextField("Username", text: $username)
                        .padding([.leading], 8)
                }
                    
                    .frame(height: 40)
                
                
                HStack {
                    Image(systemName: "lock.circle")
                        .font(.title)
                    SecureField("Password", text: $password)
                        .padding([.leading], 8)
                }
                    
                    .frame(height: 40)
                
                if !isLoggingIn {
                    HStack {
                        Image(systemName: "lock.circle")
                            .font(.title)
                        
                        SecureField("Repeat Password", text: $repeatPassword)
                            .padding([.leading], 8)
                    }
                    .frame(height: 40)
                } else {
                    EmptyView()
                        .frame(height: 40)
                }
                

                    
                    
                Button(action: {
                    if self.isLoggingIn {
                        print("Login")
                        //Check the database and try to find the user
                    } else {
//                        print("Create Account")
//
//                        #warning("Error Handling")
//                        guard self.username.count > 8 else { return }
//                        guard self.password == self.repeatPassword else { return }
//                        
//                        let user = User(name: self.username, password: self.password)
                        
                    }
                }) {
                    NavigationLink(destination: ViewControllerWrapper()) {
//                    NavigationLink(destination: Text("jflasjd")) {
                        Text(isLoggingIn ? "Log In" : "Create Account")
                            .fontWeight(.heavy)
                            .frame(width: UIScreen.main.bounds.width - 54, height: 50)
                            .background(Color.gray)
                            .foregroundColor(Color.white)
                            .cornerRadius(12)
                            .padding(.top)
                            .shadow(radius: 12, y: 10)
                        
                    }
                    
                    
                }
                Spacer()
                
            }
            .padding()
                .navigationBarTitle(Text(isLoggingIn ? "Log In" : "Sign Up"))
                .navigationBarItems(trailing:
                    Button(action: {
                        withAnimation {
                            self.isLoggingIn.toggle()
                        }
                        if self.isLoggingIn {
                            self.showFaceIDPrompt()
                        }
                    }, label: {
                        Text(isLoggingIn ? "Sign Up" : "Log In")
                    })
            )
            
        }
        
        
    }
    
    func showFaceIDPrompt() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Log In"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        
                        print("Lekker ingelogd")
                        
                    } else {
                        
                        print("test")
                        
                    }
                }
            }
        } else {
            
            print("ok.")
            
        }
    }
    
}

#if DEBUG
struct LoginView_Previews : PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif

struct ViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = ViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        return vc
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        //
    }
}

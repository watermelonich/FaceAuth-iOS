//
//  ContentView.swift
//  FaceAuth
//
//  Created by Nich on 9/23/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if authenticationManager.isAuthenticated {
                    VStack(spacing: 40) {
                        Title()
                        
                        Text("Welcome in! You are now authenticated.")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [
                                            Color(red: 59/255, green: 78/255, blue: 181/255, opacity: 0.81),
                                            Color(red: 139/255, green: 0, blue: 205/255, opacity: 0.56)
                                        ]
                                    ),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                    }
                    
                } else {
                LoginView()
                    .environmentObject(authenticationManager)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .alert (isPresented:
                        $authenticationManager.showAlert) {
                Alert(title: Text("Error"), message:
                        Text(authenticationManager
                            .errorDescription ?? "Error trying to login with credentials, please try again"), dismissButton:
                        .default(Text ("Ok")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

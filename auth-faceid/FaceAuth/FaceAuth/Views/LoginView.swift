//
//  LoginView.swift
//  FaceAuth
//
//  Created by Nich on 9/23/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager:
    AuthManager
    
    var body: some View {
        VStack {
            Title()
            
            switch
            authenticationManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid", text: "Login with FaceID")
                    .onTapGesture {
                        Task.init {
                            await
                            authenticationManager.authenticateWithBiometrics()
                        }
                    }
            case .touchID:
                PrimaryButton(image: "touchid", text: "Login with TouchID")
            default:
                PrimaryButton(image: "person.fill", text: "Login with your credentials")
            }
        }
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
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthManager())
    }
}

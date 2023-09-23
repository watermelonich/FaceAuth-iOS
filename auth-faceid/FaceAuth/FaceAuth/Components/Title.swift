//
//  Title.swift
//  FaceAuth
//
//  Created by Nich on 9/23/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .bold()
            .font(.title)
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
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

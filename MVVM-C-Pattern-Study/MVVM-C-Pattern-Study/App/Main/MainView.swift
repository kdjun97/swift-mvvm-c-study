//
//  MainView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

struct MainView: View {
    struct Coordinator {
        var navigateToLogin: () -> Void
        var navigateToForgot: () -> Void
    }

    var coordinator: Coordinator

    var body: some View {
        VStack {
            Text("This is Main View")
            Button(
                action: {
                    coordinator.navigateToLogin()
                },
                label: {
                    Text("Login")
                }
            ).padding()

            Button(
                action: {
                    coordinator.navigateToForgot()
                },
                label: {
                    Text("Forgot password")
                }
            )
        }
    }
}

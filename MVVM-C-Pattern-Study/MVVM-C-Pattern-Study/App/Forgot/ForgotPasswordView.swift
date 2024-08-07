//
//  ForgotPasswordView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI
import Foundation

struct ForgotPasswordView: View {
    struct Coordinator {
        var navigateToOpenURL: () -> Void
    }

    var coordinator: Coordinator
    @StateObject var forgotPasswordViewModel: ForgotPasswordViewModel

    var body: some View {
        VStack {
            Text("This is Forgot Password View")
            Text(forgotPasswordViewModel.name)
            Button(
                action: {
                    coordinator.navigateToOpenURL()
                },
                label: {
                    Text("Open URL")
                }
            ).padding()
        }
    }
}

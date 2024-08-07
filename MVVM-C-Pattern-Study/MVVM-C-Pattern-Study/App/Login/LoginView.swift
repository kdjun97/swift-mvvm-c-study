//
//  LoginView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

struct LoginView: View {
    struct Coordinator {
        var navigateToBack: () -> Void
        var navigateToLoginDetail: (String) -> Void
    }

    var coordinator: Coordinator
    var loginViewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        VStack {
            Text("This is Login View")
            Button {
                coordinator.navigateToBack()
            } label: {
                Text("Navigate To Back")
            }.padding()
            Button {
                coordinator.navigateToLoginDetail(loginViewModel.name)
            } label: {
                Text("Go To Login Detail")
            }.padding()
        }
    }
}

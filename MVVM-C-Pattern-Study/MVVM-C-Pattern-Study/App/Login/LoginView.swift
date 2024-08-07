//
//  LoginView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

struct LoginView: View {
    var coordinator: Coordinator
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()

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
            Button {
                loginViewModel.updateSheet(true)
            } label: {
                Text("Sheet Toggle Button")
            }
        }
        .sheet(
            isPresented: Binding(get: {loginViewModel.isSheetPresetened}, set: { _ in }), onDismiss: {
                loginViewModel.updateSheet(false)
            }
        ) {
            VStack{
                Text("This is Sheet~")
            }
        }
    }
}

extension LoginView {
    struct Coordinator {
        var navigateToBack: () -> Void
        var navigateToLoginDetail: (String) -> Void
    }
}

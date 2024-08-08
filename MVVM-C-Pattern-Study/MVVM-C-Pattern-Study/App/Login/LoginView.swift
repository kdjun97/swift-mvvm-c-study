//
//  LoginView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

struct LoginView: View {
    var coordinator: LoginCoordinator
    @ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        LoginBodyView(loginViewModel: loginViewModel, coordinator: coordinator)
        .onChange(of: loginViewModel.shouldNavigateToDetail) { value in
            if (value) {
                coordinator.navigateToLoginDetail("API 타고 들어옴")
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

private struct LoginBodyView: View {
    @ObservedObject private var loginViewModel: LoginViewModel
    var coordinator: LoginCoordinator

    fileprivate init(loginViewModel: LoginViewModel, coordinator: LoginCoordinator) {
        self.loginViewModel = loginViewModel
        self.coordinator = coordinator
    }
    
    fileprivate var body: some View {
        VStack {
            Text("This is Login View")
            Button {
                coordinator.navigateToBack()
            } label: {
                Text("Navigate To Back")
            }.padding().frame(width: 200, height: 100).background(.black)
            Button {
                coordinator.navigateToLoginDetail(loginViewModel.name)
            } label: {
                Text("Go To Login Detail")
            }.padding().frame(width: 200, height: 100).background(.cyan)
            Button {
                loginViewModel.updateSheet(true)
            } label: {
                Text("Sheet Toggle Button")
            }.frame(width: 200, height: 100).background(.green)
            Button {
                Task {
                    let result = await loginViewModel.callApiTest()
                    if (result) {
                        loginViewModel.updateShouldNavigateToDetail()
                    } else {
                        print("false!")
                    }
                }
            } label: {
                Text("가상의 API 호출")
            }.frame(width: 200, height: 100).background(.purple)
        }
    }
}

struct LoginCoordinator {
    var navigateToBack: () -> Void
    var navigateToLoginDetail: (String) -> Void
}

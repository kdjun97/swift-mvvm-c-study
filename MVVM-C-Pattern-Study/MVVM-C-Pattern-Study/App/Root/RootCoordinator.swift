//
//  AuthenticationCoordinator.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import Foundation
import SwiftUI

enum RootScreen {
    case main
    case login
    case forgotPassword(String)
    case loginDetail(String)
}

final class RootCoordinator: Hashable {
    @Binding var navigationPath: NavigationPath

    private var id: UUID
    private var page: RootScreen
    
    init(
        page: RootScreen,
        navigationPath: Binding<NavigationPath>
    ) {
        id = UUID()
        self.page = page
        self._navigationPath = navigationPath
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: RootCoordinator, rhs: RootCoordinator) -> Bool {
        lhs.id == rhs.id
    }

    func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
}

extension RootCoordinator {
    @ViewBuilder
    func view() -> some View {
        switch self.page {
        case .main:
            mainView()
        case .login:
            loginView()
        case let .forgotPassword(name):
            forgotPasswordView(name: name)
        case .loginDetail(let name):
            loginDetail(name: name)
        }
    }
}

extension RootCoordinator {
    private func mainView() -> some View {
        return MainView(
            coordinator: .init(
                navigateToLogin: {
                    self.push(
                        RootCoordinator(
                            page: .login,
                            navigationPath: self.$navigationPath
                        )
                    )
                },
                navigateToForgot: {
                    self.push(
                        RootCoordinator(
                            page: .forgotPassword("dd"),
                            navigationPath: self.$navigationPath
                        )
                    )
                }
            )
        )
    }
    
    private func loginView() -> some View {
        return LoginView(
            coordinator: .init(
                navigateToBack: {
                    self.navigationPath.removeLast()
                },
                navigateToLoginDetail: { name in
                    self.push(
                        RootCoordinator(
                            page: .loginDetail(name),
                            navigationPath: self.$navigationPath
                        )
                    )
                }
            )
        )
    }

    private func forgotPasswordView(name: String) -> some View {
        return ForgotPasswordView(
            coordinator: .init(
                navigateToOpenURL: {
                    self.navigateToOpenURL()
                }
            ),
            forgotPasswordViewModel: ForgotPasswordViewModel(name: name)
        )
    }

    private func navigateToOpenURL() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }
    
    private func loginDetail(name: String) -> some View {
        return LoginDetailView(
            coordinator: .init(
                navigateToBack: {
                    self.navigationPath.removeLast()
                }
            ),
            loginDetailViewModel: LoginDetailViewModel(name: name)
        )
    }
}

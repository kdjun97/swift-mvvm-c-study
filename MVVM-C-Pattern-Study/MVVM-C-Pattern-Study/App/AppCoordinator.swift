//
//  AppCoordinator.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath

    init(path: NavigationPath) {
        self.path = path
    }

    @ViewBuilder
    func view() -> some View {
        RootView()
    }
}

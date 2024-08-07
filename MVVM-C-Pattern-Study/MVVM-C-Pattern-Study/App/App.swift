//
//  App.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/3/24
//

import SwiftUI

@main
struct MVVM_C_Pattern_StudyApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.view()
                .navigationDestination(for: RootCoordinator.self) { coordinator in
                    coordinator.view()
                }
            }
            .environmentObject(appCoordinator)
        }
    }
}

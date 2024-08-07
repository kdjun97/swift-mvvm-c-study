//
//  RootView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/6/24
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator

    var body: some View {
        Group {
            RootCoordinator(
                page: .main,
                navigationPath: $appCoordinator.path
            ).view()
        }
    }
}

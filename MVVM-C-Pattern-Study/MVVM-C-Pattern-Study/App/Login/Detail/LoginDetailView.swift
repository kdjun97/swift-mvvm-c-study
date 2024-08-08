//
//  LoginDetailView.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/7/24
//

import SwiftUI

struct LoginDetailView: View {
    struct Coordinator {
        var navigateToBack: () -> Void
        var navigateToRoot: () -> Void
    }

    var coordinator: Coordinator
    @StateObject var loginDetailViewModel: LoginDetailViewModel

    var body: some View {
        VStack {
            Text("This is Login Detail View")
            Text(loginDetailViewModel.name)
            Button(
                action: {
                    coordinator.navigateToBack()
                },
                label: {
                    Text("Navigate To Back")
                }
            ).padding().frame(width: 300, height: 100).background(.green)
            Text("Root 로 navigation")
            Button(
                action: {
                    coordinator.navigateToRoot()
                },
                label: {
                    Text("Navigate To Root")
                }
            ).padding().frame(width: 300, height: 100).background(.orange)
        }
    }
}

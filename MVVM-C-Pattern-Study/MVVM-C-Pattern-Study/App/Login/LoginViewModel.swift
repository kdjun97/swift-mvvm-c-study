//
//  LoginViewModel.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/7/24
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var name: String = "김동준"
    @Published var isSheetPresetened: Bool = false

    func updateSheet(_ value: Bool) {
        isSheetPresetened = value
    }
}

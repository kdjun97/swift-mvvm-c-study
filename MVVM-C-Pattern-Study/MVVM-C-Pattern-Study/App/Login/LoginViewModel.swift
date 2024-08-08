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
    @Published var shouldNavigateToDetail: Bool = false

    func updateSheet(_ value: Bool) {
        isSheetPresetened = value
    }
    
    func callApiTest() async -> Bool {
        do {
            print("call Api Test STart")
            try await Task.sleep(for: .seconds(2))
            print("call Api Test end")
            return true
        } catch {
            print("Catch 걸림!")
            return false
        }
    }
    
    func updateShouldNavigateToDetail() {
        shouldNavigateToDetail = true
    }
}

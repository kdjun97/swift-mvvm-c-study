//
//  LoginDetailViewModel.swift
//  MVVM-C-Pattern-Study
//
//  Created by 김동준 on 8/7/24
//

import Foundation

final class LoginDetailViewModel: ObservableObject {
    @Published var name: String = "-"
    
    init(name: String) {
        self.name = name
    }
}

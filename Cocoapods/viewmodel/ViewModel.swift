//
//  ViewModel.swift
//  Cocoapods
//
//  Created by Gifton on 12/2/20.
//  Copyright © 2020 Javier. All rights reserved.
//

import Foundation

protocol ViewModel: Hashable, Identifiable {
    var uuid: UUID { get }
    var id: String { get }
}

extension ViewModel {

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func compare<T: Identifiable>(_ lhs: T, against rhs: T) -> Bool {
        return true
    }
    
}

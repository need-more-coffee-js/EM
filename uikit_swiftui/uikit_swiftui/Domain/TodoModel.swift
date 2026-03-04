//
//  TodoModel.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

struct Todo: Identifiable, Equatable {
    let id: Int
    let title: String
    let completed: Bool
}

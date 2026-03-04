//
//  TodoCellViewModel.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

struct TodoCellViewModel: Equatable {
    let title: String
    let statusText: String

    init(todo: Todo) {
        title = todo.title
        statusText = todo.completed ? "Completed" : "Not completed"
    }
}

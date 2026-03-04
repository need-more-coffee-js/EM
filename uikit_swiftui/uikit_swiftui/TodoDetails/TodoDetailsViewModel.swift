//
//  TodoDetailsViewModel.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation
import Combine

final class TodoDetailsViewModel: ObservableObject {
    let todo: Todo

    init(todo: Todo) {
        self.todo = todo
    }
}

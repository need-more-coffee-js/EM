//
//  TodoMapper.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

enum TodoMapper {
    static func map(_ dto: TodoDTO) -> Todo {
        Todo(id: dto.id, title: dto.todo, completed: dto.completed)
    }
}

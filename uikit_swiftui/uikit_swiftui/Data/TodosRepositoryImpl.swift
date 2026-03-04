//
//  TodosRepositoryImpl.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

final class TodosRepositoryImpl: TodosRepository {
    private let api: TodosAPIProtocol

    init(api: TodosAPIProtocol) {
        self.api = api
    }

    func fetchTodos() async throws -> [Todo] {
        let response = try await api.fetchTodos()
        return response.todos.map(TodoMapper.map)
    }
}

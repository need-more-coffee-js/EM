//
//  TodosAPI.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

protocol TodosAPIProtocol {
    func fetchTodos() async throws -> TodosResponseDTO
}

final class TodosAPI: TodosAPIProtocol {

    func fetchTodos() async throws -> TodosResponseDTO {
        let url = URL(string: "https://dummyjson.com/todos")!
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse,
              (200...299).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(TodosResponseDTO.self, from: data)
    }
}

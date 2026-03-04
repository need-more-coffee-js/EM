//
//  TodosRepository.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

protocol TodosRepository {
    func fetchTodos() async throws -> [Todo]
}

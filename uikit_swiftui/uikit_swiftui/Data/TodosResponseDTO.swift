//
//  TodosResponseDTO.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

struct TodosResponseDTO: Decodable {
    let todos: [TodoDTO]
}

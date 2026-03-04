//
//  TodoDTO.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

struct TodoDTO: Decodable {
    let id: Int
    let todo: String
    let completed: Bool
}

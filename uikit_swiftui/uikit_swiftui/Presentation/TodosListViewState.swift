//
//  TodosListViewState.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

enum TodosListViewState: Equatable {
    case idle
    case loading
    case content([Todo])
    case error(String)
}

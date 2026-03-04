//
//  TodosListRouter.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit

final class TodosListRouter: TodosListRouting {
    private weak var navigationController: UINavigationController?
    private let detailsBuilder: TodoDetailsBuilding

    init(navigationController: UINavigationController,
         detailsBuilder: TodoDetailsBuilding) {
        self.navigationController = navigationController
        self.detailsBuilder = detailsBuilder
    }

    func showTodoDetails(todo: Todo) {
        let detailsVC = detailsBuilder.build(todo: todo)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

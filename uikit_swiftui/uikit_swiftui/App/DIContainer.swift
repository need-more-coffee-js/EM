//
//  DIContainer.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit

final class DIContainer {

    // MARK: - Core
    private lazy var api: TodosAPIProtocol = TodosAPI()
    private lazy var repository: TodosRepository = TodosRepositoryImpl(api: api)

    // MARK: - Builders
    private lazy var todoDetailsBuilder: TodoDetailsBuilding = TodoDetailsBuilder()

    // MARK: - Modules
    func makeTodosListModule(navigationController: UINavigationController) -> UIViewController {
        let vm = TodosListViewModel(repository: repository)

        let router = TodosListRouter(
            navigationController: navigationController,
            detailsBuilder: todoDetailsBuilder
        )
        vm.router = router

        let vc = TodosListViewController(viewModel: vm)
        return vc
    }
}

//
//  TodosListViewModel.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import Foundation

final class TodosListViewModel {

    // Output
    var onStateChange: ((TodosListViewState) -> Void)?

    private(set) var state: TodosListViewState = .idle {
        didSet { onStateChange?(state) }
    }

    // Dependencies
    private let repository: TodosRepository
    var router: TodosListRouting?

    // Data
    private var items: [Todo] = []

    init(repository: TodosRepository) {
        self.repository = repository
    }

    func onViewDidLoad() {
        load()
    }

    func onPullToRefresh() {
        load()
    }

    func numberOfRows() -> Int {
        items.count
    }

    func cellViewModel(at index: Int) -> TodoCellViewModel {
        TodoCellViewModel(todo: items[index])
    }

    func didSelectRow(at index: Int) {
        router?.showTodoDetails(todo: items[index])
    }

    private func load() {
        state = .loading

        Task {
            do {
                let todos = try await repository.fetchTodos()
                await MainActor.run {
                    self.items = todos
                    self.state = .content(todos)
                }
            } catch {
                await MainActor.run {
                    self.state = .error(error.localizedDescription)
                }
            }
        }
    }
}

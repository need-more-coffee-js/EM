//
//  TodosListViewController.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit
import SnapKit

final class TodosListViewController: UIViewController {
    
    private let segmentedControl = UISegmentedControl(items: ["UIKit","SwiftUI"])

    private let viewModel: TodosListViewModel

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let refreshControl = UIRefreshControl()

    init(viewModel: TodosListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Todos"
        view.backgroundColor = .systemBackground

        setupUI()
        bind()
        setupSegmentedControl()
        
        viewModel.onViewDidLoad()
    }
    
    private func setupSegmentedControl(){
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(
            self,
            action: #selector(segmentChanged),
            for: .valueChanged
        )
    }
    
    @objc private func segmentChanged() {
        viewModel.changeDisplayMode(to: segmentedControl.selectedSegmentIndex)
    }

    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TodoCell.self, forCellReuseIdentifier: TodoCell.reuseID)
        tableView.register(SwiftUITodoCell.self, forCellReuseIdentifier: SwiftUITodoCell.reuseID)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 72

        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl).inset(50)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func bind() {
        viewModel.onStateChange = { [weak self] state in
            guard let self else { return }
            switch state {
            case .idle:
                break

            case .loading:
                break

            case .content:
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()

            case .error(let message):
                self.refreshControl.endRefreshing()
                self.tableView.reloadData()
                self.showError(message)
            }
        }
    }

    @objc private func onRefresh() {
        viewModel.onPullToRefresh()
    }

    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension TodosListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.cellType() {
        case .uikit:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
            let vm = viewModel.cellViewModel(at: indexPath.row)
            cell.configure(vm)
            return cell
        case .swiftui:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftUICell", for: indexPath) as! SwiftUITodoCell
            let vm = viewModel.cellViewModel(at: indexPath.row)
            cell.configure(with: vm)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath.row)
    }
}

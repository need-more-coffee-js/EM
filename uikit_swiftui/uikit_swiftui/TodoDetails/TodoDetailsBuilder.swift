//
//  TodoDetailsBuilder.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit
import SwiftUI

protocol TodoDetailsBuilding {
    func build(todo: Todo) -> UIViewController
}

final class TodoDetailsBuilder: TodoDetailsBuilding {
    func build(todo: Todo) -> UIViewController {
        let vm = TodoDetailsViewModel(todo: todo)
        let view = TodoDetailsView(viewModel: vm)
        return UIHostingController(rootView: view)
    }
}

//
//  SwiftUITodoCell.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import UIKit
import SwiftUI

final class SwiftUITodoCell: UITableViewCell{
    static let reuseID = "SwiftUICell"
    
    func configure(with viewModel: TodoCellViewModel) {
        contentConfiguration = UIHostingConfiguration{
            VStack(alignment: .leading){
                Text(viewModel.title)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Spacer()
                Text(viewModel.statusText)
                    .foregroundColor(.secondary)
            }
        }
    }
}

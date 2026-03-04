//
//  TodoDetailsView.swift
//  uikit_swiftui
//
//  Created by Денис Ефименков on 04.03.2026.
//

import SwiftUI

struct TodoDetailsView: View {
    @ObservedObject var viewModel: TodoDetailsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Todo #\(viewModel.todo.id)")
                .font(.headline)

            Text(viewModel.todo.title)
                .font(.title3)
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Text("Status:")
                    .foregroundStyle(.secondary)
                Text(viewModel.todo.completed ? "Completed" : "Not completed")
                    .fontWeight(.semibold)
            }

            Spacer()
        }
        .padding(16)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

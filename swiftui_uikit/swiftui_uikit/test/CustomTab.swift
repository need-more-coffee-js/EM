//
//  CustomTab.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                // Левая кнопка
                tabButton(title: "Активные", id: 0)
                // Правая кнопка
                tabButton(title: "За все время", id: 1)
            }
            .padding(.top, 20) // Отступ сверху до текста
            
            Divider() // Тонкая серая линия под всем переключателем
        }
    }
    
    // Вспомогательная функция для создания кнопки
    func tabButton(title: String, id: Int) -> some View {
        Button(action: { selectedTab = id }) {
            VStack(spacing: 12) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(selectedTab == id ? .black : .gray)
                
                // Синяя линия под активным текстом
                Rectangle()
                    .fill(selectedTab == id ? Color.blue : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    CustomTabView()
}

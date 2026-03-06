//
//  MainScreen.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

enum TichetState: String, CaseIterable{
    case actual = "Actual"
    case done = "Done"
}

struct MainScreen: View {
        
    var body: some View {
            
            VStack(alignment: .leading){

                
                TopImage()
                
                MiddleView()
                    .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 2)
                    .padding(.horizontal)
                
                ZakazView()
                    .padding(.horizontal)
                
                PrimaryButton(title: "check", bgColor: .blue, textColor: .white)
                    .padding(.horizontal)
                
                PrimaryButton(title: "otmena", bgColor: .gray, textColor: .white)
                    .padding(.bottom)
                    .padding(.horizontal)
                
            }
            .frame(maxWidth: .infinity) // Растягиваем на всю ширину
            .background(Color.blue)     // Цвет фона самого VStack
            .clipShape(RoundedRectangle(cornerRadius: 20)) // Закругление
            .padding(.horizontal, 16)   // ВНЕШНИЕ отступы (те самые «по бокам»)
    }
        
}

#Preview {
    MainScreen()
}

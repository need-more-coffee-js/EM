//
//  Buttons.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

enum ButtonsState: String{
    case check = "check"
    case otmena = "otmena"
}

struct PrimaryButton: View {
    let title: String
    let bgColor: Color
    let textColor: Color

    var body: some View {
        Button (action: {}){
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
        }
        .background(bgColor)
        .foregroundColor(textColor)
        .cornerRadius(12)
    }
}

#Preview {
    PrimaryButton(title: "button", bgColor: .blue, textColor: .white)
}

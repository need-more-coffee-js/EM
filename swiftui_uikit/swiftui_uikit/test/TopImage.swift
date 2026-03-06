//
//  test.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

struct TopImage: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("tourImage")
                .resizable()
                .scaledToFit()
            Text("2 bileta")
                .padding(.horizontal,20)
                .background(
                    Color.white
                        .cornerRadius(10)
                )
                .offset(x: -120,y: -12)
                
        }
    }
}

#Preview {
    TopImage()
}

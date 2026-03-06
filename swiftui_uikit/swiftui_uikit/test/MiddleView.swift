//
//  MiddleView.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

struct MiddleView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("экскупсия по городу")
                .font(.headline)
            
            HStack{
                Text("17 august")
                Text("12:00")
            }
            .font(.subheadline)
        }
    }
}

#Preview {
    MiddleView()
}

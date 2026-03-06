//
//  FinalView.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

//enum TichetState: String, CaseIterable{
//    case actual = "Actual"
//    case done = "Done"
//}

struct FinalView: View {
    
    @State private var selectedTab: TichetState = .actual
    
    var body: some View {
            CustomTabView()
                .padding(.bottom)
        
        switch selectedTab {
        case .actual:
            MainScreen()
        case .done:
            NewView()
        }
            
    }
        
}

#Preview {
    FinalView()
}

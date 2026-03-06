//
//  UIViewControllerRepresentable.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 04.03.2026.
//

import SwiftUI

struct UIVCRep: View {
    
    @State private var showPicker: Bool = false
    @State private var avatarImage = UIImage(systemName: "person.fill")!
    
    var body: some View {
        VStack{
            Image(uiImage: avatarImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding()
                .onTapGesture { showPicker = true }
            
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $showPicker) {
            MyPicker(avatarImage: $avatarImage)
        }
    }
}

#Preview {
    UIVCRep()
}

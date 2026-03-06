//
//  Picker.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

struct MyPicker: UIViewControllerRepresentable {
    
    @Binding var avatarImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: MyPicker
            
        init(photoPicker: MyPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                photoPicker.avatarImage = image
            }else {
                print("error")
            }
            picker.dismiss(animated: true)
        }
    }
}

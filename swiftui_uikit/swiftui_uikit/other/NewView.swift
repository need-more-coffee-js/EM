//
//  NewView.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 06.03.2026.
//

import SwiftUI

struct NewView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack{
            Text(text)
            TextField("type", text: $text)
            UItextFieldRep(text: $text)
                .frame(height: 55)
                .background(Color.yellow)
        }
        
    }
}

#Preview {
    NewView()
}

struct UItextFieldRep: UIViewRepresentable{
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let tf = getText()
        tf.delegate = context.coordinator
        return tf
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getText() -> UITextField{
        let tf = UITextField(frame: .zero)
        let placeholder = NSAttributedString(
            string: "uikit placeholder",
            attributes: [
                .foregroundColor : UIColor.red
            ]
        )
        tf.attributedPlaceholder = placeholder
        return tf
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}

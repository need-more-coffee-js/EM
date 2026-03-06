//
//  ContentView.swift
//  swiftui_uikit
//
//  Created by Денис Ефименков on 04.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            
            HStack {
                Text("SwiftUI")
                TextField("type...", text: $text)
                    .frame(height: 55)
                    .background(Color.green)
            }

            
            HStack {
                Text("UIKit")
                UITextFieldRep(
                    text: $text,
                    //placeholder: "new placeholder",
                    placeholderUIColor: .blue
                )
                .updatePlaceholder("update placeholder")
                    .frame(height: 55)
                    .background(Color.green)
            }
            
        }
        .padding()
    }
}

struct UITextFieldRep: UIViewRepresentable{
    
    @Binding var text: String
    var placeholder : String
    let placeholderUIColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "default", placeholderUIColor: UIColor = .red) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderUIColor = placeholderUIColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = getText()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    func getText() -> UITextField {
        let textfiled = UITextField(frame: .zero)
        
        let placeholder = NSAttributedString(
            string: placeholder,
            attributes: [
                .foregroundColor: placeholderUIColor
            ])
        
        textfiled.attributedPlaceholder = placeholder
        return textfiled
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldRep{
        var viewRepresent = self
        viewRepresent.placeholder = text
        return viewRepresent
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


#Preview {
    ContentView()
}

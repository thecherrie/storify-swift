//
//  ImagePicker.swift
//  storify
//
//  Created by Ash C on 16/02/2022.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    
    @Binding var selectedMedia: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedMedia = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = sourceType
        
        imagePicker.delegate = context.coordinator

        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
}

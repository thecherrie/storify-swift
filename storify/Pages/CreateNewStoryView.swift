//
//  CreateNewStoryView.swift
//  storify
//
//  Created by Ash C on 15/02/2022.
//

import SwiftUI
import AVFoundation

struct CreateNewStoryView: View {
    
    @StateObject var camera = CameraModel()
    @Binding var isShowPhotoPicker: Bool
    
    var body: some View {
        VStack{
            if(camera.isTaken) {}
            ZStack{
                Color.black
                Button(action: {
                    isShowPhotoPicker = true
                }, label: {
                    Text("Select media")
                })
            }
        }
        .ignoresSafeArea()
        .onAppear(perform: {
            camera.checkCameraPermission()
        })
    }
}

struct CreateNewStoryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewStoryView(isShowPhotoPicker: .constant(false))
    }
    
}

class CameraModel: ObservableObject {
    
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    func checkCameraPermission() {
        //check permission
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case.authorized:
            setupCamera()
            return
        case.notDetermined:
            //req permission
            AVCaptureDevice.requestAccess(for: .video) {
                (status) in
                
                if status{
                    self.setupCamera()
                }
            }
        case.denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setupCamera(){
        //set up cam
        
        do {
            self.session.beginConfiguration()
            
            let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
}

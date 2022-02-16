//
//  ContentView.swift
//  storify
//
//  Created by Ash C on 05/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentView: Int = 0
    @State var isShowPhotoPicker = false
    @State var selectedMedia = UIImage()
    
    var body: some View {
        
        NavigationView{
            ZStack{
                switch currentView {
                case 1:
                    CreateNewStoryView(isShowPhotoPicker: $isShowPhotoPicker)
                case 2:
                    VStack{
                        ProfileView()
                        AsyncImage(url: URL(string: "https://example.com/icon.png")) { image in
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth:0, maxWidth: .infinity)
                            .ignoresSafeArea()
                        }
                    }
                    
                default:
                    FeedView()
                        .navigationBarHidden(true)
                }
                VStack{
                    Spacer()
                    BottomNavigationMenuView(currentView: $currentView)
                        .foregroundColor(.white)
                }
            }
            .sheet(isPresented: $isShowPhotoPicker, content: {
                ImagePicker(selectedMedia: self.$selectedMedia, sourceType: .photoLibrary)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

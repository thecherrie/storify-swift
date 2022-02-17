//
//  FeedView.swift
//  storify
//
//  Created by Ash C on 12/02/2022.
//

import SwiftUI
import AVKit

struct VideoPlayer: UIViewControllerRepresentable {
    
    var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<VideoPlayer>) {
        
    }
    
}

struct FeedView: View {
    
    var videos = [
        "https://bit.ly/swswift",
        "http://clips.vorwaerts-gmbh.de/VfE_html5.mp4",
    ]
    
    @State var index = 0
    
    
    var body: some View {
            GeometryReader{proxy in
                
                let size = proxy.size
                
                    TabView(selection: $index) {
                        ForEach(0..<videos.count, id: \.self) { i in
                            ZStack{
                                let player = AVPlayer(url: URL(string: videos[i])!)
                                VideoPlayer(player: player)
                                    .onDisappear() {
                                        player.pause()
                                    }
                                    .onAppear() {
                                        player.play()
                                    }
                                LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0.0)]), startPoint: .bottom, endPoint: .center)
                                VStack{
                                    Spacer()
                                    HStack(alignment:.bottom){
                                        VStack(alignment:.leading){
                                            UserMiniProfileView()
                                                .foregroundColor(.white)
                                            VideoDescriptionView(description: videos[i])
                                                .foregroundColor(.white)
                                        }
                                        .padding()
                                        LikeShareButtonsView()
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(.bottom, 50)
                            }
                        }
                        .frame(width: size.width)
                        .rotationEffect(.init(degrees: -90))
                    }
                    .onAppear(perform: {
                        UIScrollView.appearance().alwaysBounceVertical = false
                    })
                    .rotationEffect(.init(degrees: 90))
                    .frame(width: size.height)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .background(Color.black.ignoresSafeArea(.all,edges:.all))
                    .frame(width: size.width)
            }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

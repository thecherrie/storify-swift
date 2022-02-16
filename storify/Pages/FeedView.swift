//
//  FeedView.swift
//  storify
//
//  Created by Ash C on 12/02/2022.
//

import SwiftUI

struct FeedView: View {
    @State var index = 0
    
    var body: some View {
            GeometryReader{proxy in
                
                let size = proxy.size
                
                    TabView(selection: $index) {
                        ForEach(1...10, id: \.self) { i in
                            ZStack{
                                Color.gray
                                LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0.0)]), startPoint: .bottom, endPoint: .center)
                                VStack{
                                    Spacer()
                                    HStack(alignment:.bottom){
                                        VStack(alignment:.leading){
                                            UserMiniProfileView()
                                                .foregroundColor(.white)
                                            VideoDescriptionView(description: "A test decription")
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

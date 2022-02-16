//
//  SocialControlPanel.swift
//  storify
//
//  Created by Ash C on 05/02/2022.
//

import SwiftUI

struct LikeShareButtonsView: View {
    var body: some View {
        VStack() {
            Button(action: {} ) {
                Text(.init(systemName: "heart.fill"))
                    .foregroundColor(.white)
            }.padding()
            Button(action: {} ) {
                Text(.init(systemName: "bubble.left.fill"))
                    .foregroundColor(.white)
            }.padding()
            Button(action: {} ) {
                Text(.init(systemName: "paperplane.fill"))
                    .foregroundColor(.white)
            }.padding()
        }
    }
}

struct SocialControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        LikeShareButtonsView()
            .background(Color.black)
    }
}

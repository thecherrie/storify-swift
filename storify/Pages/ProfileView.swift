//
//  ProfileView.swift
//  storify
//
//  Created by Ash C on 12/02/2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Color.black
            Text("profile view")
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

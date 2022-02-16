//
//  UserMiniProfileView.swift
//  storify
//
//  Created by Ash C on 05/02/2022.
//

import SwiftUI

struct UserMiniProfileView: View {
    var body: some View {
        HStack{
            Circle()
                .foregroundColor(.black)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            VStack(alignment:.leading){
                Text("User")
                Text("@handle")
            }
            Spacer()
            
        }
    }
}

struct UserMiniProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserMiniProfileView()
    }
}

//
//  BottomNavigationMenuView.swift
//  storify
//
//  Created by Ash C on 05/02/2022.
//

import SwiftUI

struct IconButtonView: View {
    let icon: String
    var body: some View {
            Text(.init(systemName: icon))
                .foregroundColor(.white)
    }
}

struct BottomNavigationMenuView: View {
    
    @Binding var currentView: Int
    
    var body: some View {
        HStack(spacing: 100) {
            Button(action: {
                currentView = 0
            } ) {
                Text(.init(systemName: "house.fill"))
                    .foregroundColor(.white)
            }
            Button(action: {
                currentView = 1
            } ) {
                Text(.init(systemName: "plus.app.fill"))
                    .foregroundColor(.white)
            }
            Button(action: {
                currentView = 2
            } ) {
                Text(.init(systemName: "person.fill"))
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct BottomNavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationMenuView(currentView: .constant(0))
            .background(Color.orange)
    }
}

//
//  VideoDescriptionView.swift
//  storify
//
//  Created by Ash C on 05/02/2022.
//

import SwiftUI

struct VideoDescriptionView: View {
    
    let description: String

    
    var body: some View {
        if(description.count > 60) {
            let index = description.index(description.startIndex, offsetBy: 60)
            Text(description[..<index]+"...")
        }
        Text(description)
    }
    
}

struct VideoDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDescriptionView(description:"test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test")
    }
}

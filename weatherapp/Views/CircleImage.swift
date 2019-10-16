//
//  CircleImage.swift
//  weatherapp
//
//  Created by Felix Boquet on 15/10/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct CircleImage: View {

    var image: String

    var body: some View {
        Image(image)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

@available(iOS 13.0.0, *)
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: "sun")
    }
}

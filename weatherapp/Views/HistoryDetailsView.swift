//
//  HistoryDetailsView.swift
//  weatherapp
//
//  Created by Felix Boquet on 16/10/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct HistoryDetailsView: View {

    let history: History

    var body: some View {

        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: history.imageName)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {

                Text(String(describing: history.temperature))
                    .font(.title)

                HStack {
                    Text(history.address)
                        .font(.subheadline)
                    Spacer()
                    Text(history.date!)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    } 
}

@available(iOS 13.0.0, *)
struct HistoryDetailsView_Previews: PreviewProvider {
    static var hist = History(address: "Toulouse", date: "16/10/2019", imageName: "cloud", temperature: 23.0)
    static var previews: some View {
        HistoryDetailsView(history: hist)
    }
}

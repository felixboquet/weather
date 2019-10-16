//
//  HistoryRow.swift
//  weatherapp
//
//  Created by Felix Boquet on 16/10/2019.
//  Copyright © 2019 Felix Boquet. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct HistoryRow: View {

    let history: History

    var body: some View {
        HStack {
            CircleImage(image: history.image)
                .frame(width: 50, height: 50)
            Text(String(describing: history.temperature))
        }
    }
}

@available(iOS 13.0.0, *)
struct HistoryRow_Previews: PreviewProvider {
    static var hist = History(address: "Toulouse", date: "16/10/2019", image: "sun", temperature: 23.0)
    static var previews: some View {
        Group {
            HistoryRow(history: hist)
            HistoryRow(history: hist)
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}

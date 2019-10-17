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
            history.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(String(describing: history.temperature))
        }
    }
}

#if DEBUG
@available(iOS 13.0.0, *)
struct HistoryRow_Previews: PreviewProvider {
    static var HistoryVariable = History(address: "Toulouse", date: "16/10/2019", imageName: "cloud", temperature: 23.0)

    static var previews: some View {
        Group {
            HistoryRow(history: HistoryVariable)
            HistoryRow(history: HistoryVariable)
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
#endif

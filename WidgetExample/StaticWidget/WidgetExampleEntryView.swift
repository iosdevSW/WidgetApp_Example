//
//  WidgetExampleEntryView.swift
//  WidgetApp_Example
//
//  Created by iOS신상우 on 4/15/24.
//

import SwiftUI
import WidgetKit

// 위젯 화면을 구성하는 SwiftUI View
struct WidgetExampleEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)

            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

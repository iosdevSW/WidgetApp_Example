//
//  WidgetExample.swift
//  WidgetExample
//
//  Created by iOS신상우 on 4/15/24.
//

import WidgetKit
import SwiftUI

struct WidgetExample: Widget {
    let kind: String = "WidgetExample"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetExampleEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetExampleEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget") // 위젯추가시 보일 위젯 이름
        .description("This is an example widget.") // 위젯추가시 보일 위젯 설명
    }
}

#Preview(as: .systemSmall) {
    WidgetExample()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}

//
//  WidgetExampleWithIntent.swift
//  WidgetApp_Example
//
//  Created by iOS신상우 on 4/15/24.
//

import SwiftUI
import WidgetKit

struct WidgetExampleWithIntent: Widget {
    let kind = "WidgetExampleWithIntent"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: BookListIntent.self,
                            provider: IntentProvider(),
                            content: { entry in
            WidgetExampleEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        })
        .configurationDisplayName("My Intent Widget")
        .description("Intent Widget Example")
    }
}

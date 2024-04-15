//
//  AppIntent.swift
//  WidgetExampleExtension
//
//  Created by iOS신상우 on 4/15/24.
//

import SwiftUI
import WidgetKit

struct WidgetExampleWithAppIntent: Widget {
    let kind = "WidgetExampleWithAppIntent"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind,
                            intent: BookListIntent.self,
                            provider: IntentProvider(),
                            content: { entry in
            WidgetExampleEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        })
        .configurationDisplayName("My AppIntent Widget")
        .description("AppIntent Widget Example")
    }
}


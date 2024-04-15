//
//  IntentProvider.swift
//  WidgetExampleExtension
//
//  Created by iOS신상우 on 4/15/24.
//

import Foundation
import WidgetKit

struct IntentProvider: IntentTimelineProvider {
    typealias Intent = BookListIntent
    typealias Entry = SimpleEntry
    
    func placeholder(in context: Context) -> Entry {
        SimpleEntry(date: .now, emoji: "🥹")
    }
    
    func getSnapshot(for configuration: Intent, in context: Context, completion: @escaping (Entry) -> Void) {
        let entry = SimpleEntry(date: .now, emoji: "😇")
        completion(entry)
    }
    
    func getTimeline(for configuration: Intent, in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        let emoji = configuration.emoji ?? "😨"
        let currentDate = Date()
        for minuteOffset in 0 ..< 10 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "\(emoji)")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .after(.now))
        completion(timeline)
    }
}

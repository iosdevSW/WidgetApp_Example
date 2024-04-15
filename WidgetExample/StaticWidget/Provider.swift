//
//  Provider.swift
//  WidgetApp_Example
//
//  Created by iOS신상우 on 4/15/24.
//

import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "🥶")
    }

    /* 하나의 엔트리가 필요할때 호출됨 
     isPreview == true -> 위젯갤러리 즉 위젯 선택화면 -> 미리보기 데이터 넣기
     isPreview == false -> 홈에서 위젯 추가했을때 -> 최신상태가져와서 넣기
     위와같이 분기 필요
     */
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "🫥")
        completion(entry)
    }

    // 현재 시간과 선택적으로 위젯을 업데이트할 미래 시간에 대한 타임라인 엔트리 배열을 제공함
    // TimeProvider의 존재하는 entry시간에 entry data로 위젯을 업데이트함
    // WidgetKit에 의해 위젯이 스케줄링되어 업데이트됨 이는 배터리수명, 사용자경험등을 통해 적절히 결정됨
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for minuteOffset in 0 ..< 10 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

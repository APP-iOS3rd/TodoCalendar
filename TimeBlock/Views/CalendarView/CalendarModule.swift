//
//  CalendarModule.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/20/23.
//

import Foundation
import SwiftUI
import SwiftData
import FSCalendar
 
struct CalendarModule: UIViewRepresentable {
     
    typealias UIViewType = FSCalendar
    var calendar = FSCalendar()
    
    @Binding var selectedDate: Date
    @Query var tasks: [Task]

    func updateEvent() -> [String] {
        var eventDays: [String] = []
        
        for task in tasks {
            eventDays.append(task.date ?? "")
        }
        
        return eventDays
    }
    
    func isEvent(date: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 (E)"
        
        let events = updateEvent()
        
        for event in events {
            let day: String = dateFormatter.string(from: date)
            if day == event {
                return true
            }
        }
        
        return false
        
    }
    func makeUIView(context: Context) -> FSCalendar {
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
       // calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerTitleFont = UIFont(name: "Pretendard-ExtraBold", size: 24)
        calendar.appearance.headerTitleColor = UIColor.accent
        calendar.headerHeight = 60
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.weekdayTextColor = UIColor.accent
        
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = UIColor.accent
        calendar.appearance.selectionColor = UIColor.accent
      
        calendar.appearance.eventDefaultColor = UIColor.green
        calendar.appearance.eventSelectionColor = UIColor.green

        
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
        uiView.reloadData()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
  
    class Coordinator: NSObject, ObservableObject,
          FSCalendarDelegate,
                       FSCalendarDataSource {
         
        var parent: CalendarModule
        
        init(_ parent: CalendarModule) {
            self.parent = parent
        }

        func calendar(_ calendar: FSCalendar,
                      didSelect date: Date,
                      at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }

        func calendar(_ calendar: FSCalendar,
                  imageFor date: Date) -> UIImage? {
//            if isWeekend(date: date) {
//                return UIImage(systemName: "sparkles")
//            }
            return nil
        }

        func calendar(_ calendar: FSCalendar,
                      numberOfEventsFor date: Date) -> Int {
            var eventCount = 0
            if parent.isEvent(date: date) {
                eventCount += 1
            }
            return eventCount
        }

//        func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
//            if isWeekend(date: date) {
//                return false
//            }
//            return true
//        }

//        func maximumDate(for calendar: FSCalendar) -> Date {
//            Date.now.addingTimeInterval(86400 * 30)
//        }
//
//        func minimumDate(for calendar: FSCalendar) -> Date {
//            Date.now.addingTimeInterval(-86400 * 30)
//        }
    }
}

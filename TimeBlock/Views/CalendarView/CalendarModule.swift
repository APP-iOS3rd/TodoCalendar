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

class CalendarModule: UIViewController, FSCalendarDelegate, ObservableObject{
    var calendar = FSCalendar()
   
    @Published var selectedDate: Date = Date()
    //var events = [ToDoData]()
    
    // 저장한 이벤트 갖고오기(임의데이터)
    let eventsSample = ["2023-12-25","2023-12-31"]
    let eventsSampleDone = ["2023-12-23","2023-12-11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initCalendar()
        view.addSubview(calendar)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // print(#function)

    }
    private func initCalendar(){
        calendar.locale = Locale(identifier: "ko_KR")
        
        calendar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
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

    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 한국 시간 기준 date 출력
        self.selectedDate = date // 선택된 날짜 업데이트
    }
    
}
extension CalendarModule: FSCalendarDataSource{
   
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale.init(identifier: "ko_KR")
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//   
////        for event in events {
////            if event.date.contains(date.dateToString){
////                return 1
////            }
////        }
//        for dateStr in eventsSample {
//            if(dateFormatter.string(from: date) == dateStr){
//                return 1
//            }
//        }
//        for dateStr in eventsSampleDone {
//            if(dateFormatter.string(from: date) == dateStr){
//                return 1
//            }
//        }
        return 0
    }
}
struct CalendarModuleViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    @EnvironmentObject var calendarModule: CalendarModule
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarModuleViewController>) -> UIViewController {
        let viewController = calendarModule
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<CalendarModuleViewController>) {
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    
    final class Coordinator: NSObject, FSCalendarDelegate {
        private var parent: CalendarModuleViewController
        
        init (_ parent: CalendarModuleViewController) {
            self.parent = parent
        }
    }
}
 
//
//struct CalendarModuleView: View {
//    
//    var body: some View {
//        CalendarModuleViewController()
//    }
//    
//}

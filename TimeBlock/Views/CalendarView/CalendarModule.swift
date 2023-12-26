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
        calendar.headerHeight = 60
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        
        calendar.appearance.todayColor = UIColor.systemGreen
        calendar.appearance.selectionColor = UIColor.systemBlue
      
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
       
        // 저장한 이벤트 갖고오기
        let events = ["2023-12-25","2023-12-31"]
        
       // print(events)
        for dateStr in events {
            if(dateFormatter.string(from: date) == dateStr){
                return 1
            }
        }
        return 0
       // return tasks.filter()
      
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
 

struct CalendarModuleView: View {
    
    var body: some View {
        CalendarModuleViewController()
    }
    
}

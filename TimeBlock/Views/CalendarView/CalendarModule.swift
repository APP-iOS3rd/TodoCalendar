//
//  CalendarModule.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/20/23.
//

import Foundation
import SwiftUI
import FSCalendar

class CalendarModule: UIViewController, FSCalendarDelegate, ObservableObject{
    var calendar = FSCalendar()
    @Published var selectedDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        selectedDate = calendar.today
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initCalendar()
        view.addSubview(calendar)
    }
    
    private func initCalendar(){
        calendar.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width)
        calendar.appearance.todayColor = UIColor.systemGreen
        calendar.appearance.selectionColor = UIColor.systemBlue
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        // 한국 시간 기준 date 출력
        self.selectedDate = date // 선택된 날짜 업데이트
        print(self.selectedDate)
//        let dfMatter = DateFormatter()
//        dfMatter.locale = Locale(identifier: "ko_KR")
//        dfMatter.dateFormat = "MM월 dd일 (E)"
//        print(dfMatter.string(from: date))
//        self.selectedDate = dfMatter.string(from: date)
       
    }
    
}
//extension CalendarModule: FSCalendarDataSource{
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        return tasks.filter()
//    }
//}
struct CalendarModuleViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CalendarModuleViewController>) -> UIViewController {
        let viewController = CalendarModule()
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

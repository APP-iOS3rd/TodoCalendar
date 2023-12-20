//
//  HowToUseViewModel.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import Foundation
import Combine

final class HowToUseViewModel: ObservableObject{
    
    @Published var howToUseList: [HowToUse] = []
    init() {
        fetchModel()
    }
}

extension HowToUseViewModel {
    public func fetchModel(){
        self.howToUseList = [
            HowToUse(id:0,image: "재생화면", title: "오늘의 할일", content:"To do list로 언제 어디서든 해야할일을 한눈에",bgColor: .lightBlue),
            HowToUse(id:1,image: "재생화면", title: "똑똑한 나만의 기록장", content:"메모장으로 생각나는 기록은 언제든지", bgColor: .lightGreen),
            HowToUse(id:2,image: "재생화면", title: "하나라도 놓치지 않도록", content:"음성메모 기능으로 놓치고 싶지않은 기록까지", bgColor: .lightBlue)
        ]
    }
    
}

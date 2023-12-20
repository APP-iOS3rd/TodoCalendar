//
//  CalendarView.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/9/23.
//

import SwiftUI
import PromiseKit
import CoreLocation

struct CalendarView:View {
    
    var body: some View {
        
        NavigationView {
            VStack{
                VStack {
                    Spacer()
                    CalendarModuleView()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("Details")
                    Spacer()
                }
                Spacer()
                
            }
        }
        
        
    }
    
    
}




#Preview {
    CalendarView()
}

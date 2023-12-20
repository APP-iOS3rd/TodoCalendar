//
//  MainView.swift
//  TimeBlock
//
//  Created by 김소혜 on 12/17/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            if viewRouter.currentPage == "page1" {
                OnboardingView(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "page2" {
                TabBarView()
            }
        }
    }
}

//#Preview {
//    MainView(viewRouter: ViewRouter())
//}

//
//  Onboarding.swift
//  TimeBlock
//
//  Created by 김소혜 on 11/15/23.
//

import SwiftUI

struct OnboardingView : View {
    
    @State var currentIndex: Int = 0
    @StateObject var viewModel: HowToUseViewModel = .init()
 
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(viewModel.howToUseList){ index in
                
                ZStack(alignment: .bottom){
                    index.bgColor
                        .ignoresSafeArea()
                    ZStack(alignment: .bottom) {
                        
                        Image(index.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 280)
                            .offset(y:-100)
                        
                        VStack(spacing:10){
                            Text(index.title)
                                .font(.bold20)
                            Text(index.content)
                                .font(.light14)
                            Spacer()
                            
                            Button {
                                if currentIndex == 3 {
                                    self.viewRouter.currentPage = "page2"
                                } else {
                                    currentIndex = currentIndex + 1
                                }
                                
                            } label: {
                                Text("다음으로")
                            }
                        }
                        .padding(.horizontal,30)
                        .padding(.vertical,70)
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                        .background(Color.white)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
       
    }
}

 
#Preview {
    OnboardingView(viewRouter: ViewRouter())
}

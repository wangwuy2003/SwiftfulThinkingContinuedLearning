//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 16/1/26.
//

import SwiftUI
internal import Combine

struct TimerBootcamp: View {
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // Current time
    /*
    @State var currentDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // Countdown
    /*
     @State var count: Int = 10
     @State var finishedText: String? = nil
     */
   
    // Countdown to date
    /*
     @State var timeRemaining: String = ""
     let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
     
     func updateTimeRemaining() {
         let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
         let minute = remaining.minute ?? 0
         let second = remaining.second ?? 0
         
         timeRemaining = "\(minute) minutes, \(second) seconds"
     }
     */
    
    // Animation Counter
    @State var count: Int = 1
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundStyle(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundStyle(.red)
                    .tag(1)
                
                Rectangle()
                    .foregroundStyle(.blue)
                    .tag(2)
                
                Rectangle()
                    .foregroundStyle(.green)
                    .tag(3)
                
                Rectangle()
                    .foregroundStyle(.orange)
                    .tag(4)
                
                Rectangle()
                    .foregroundStyle(.purple)
                    .tag(5)
            }
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal)
            .tabViewStyle(.page)
        }
        .onReceive(timer) { _ in
            withAnimation(.spring) {
                count = count == 5 ? 1 : count + 1
            }
        }
    }
}

#Preview {
    TimerBootcamp()
}

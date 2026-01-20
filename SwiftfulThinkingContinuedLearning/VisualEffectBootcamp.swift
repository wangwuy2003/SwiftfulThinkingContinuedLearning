//
//  VisualEffectBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 20/1/26.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    @State private var showSpacer: Bool = false
    
    var body: some View {
//        VStack {
//            Text("hello world!faewfeawfaewfeawfew")
//                .padding()
//                .background(.red)
//                .visualEffect { content, geometry in
//                    content
//                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
////                        .grayscale(geometry.size.width >= 200 ? 1 : 0)
//                }
//            
//            if showSpacer {
//                Spacer()
//            }
//        }
//        .animation(.easeIn, value: showSpacer)
//        .onTapGesture {
//            showSpacer.toggle()
//        }
        
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.05)
                        }
                }
            }
        }
            
    }
}

#Preview {
    VisualEffectBootcamp()
}

//
//  ScrollViewPaging.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 22/1/26.
//

import SwiftUI

struct ScrollViewPaging: View {
    @State private var scrollPosition: Int? = nil
    var body: some View {
//        ScrollView {
//            VStack(spacing: 0) {
//                ForEach(0..<20) { index in
//                    Rectangle()
////                        .frame(width: 300, height: 300)
//                        .overlay {
//                            Text("\(index)")
//                                .foregroundStyle(.white)
//                        }
//                        .frame(maxWidth: .infinity)
////                        .padding(.vertical, 10)
//                        .containerRelativeFrame(.vertical, alignment: .center)
//                }
//            }
//        }
//        .ignoresSafeArea()
//        .scrollTargetLayout()
//        .scrollTargetBehavior(.paging)
//        .scrollBounceBehavior(.basedOnSize)
        
        VStack {
            Button("Scroll to") {
                scrollPosition = (0..<20).randomElement()
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                Text("\(index)")
                                    .foregroundStyle(.white)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
    //                        .containerRelativeFrame(.horizontal, alignment: .center)
                            .id(index)
                            .scrollTransition(.interactive.threshold(.visible(0.9))) { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0)
                                    .offset(y: phase.isIdentity ? 0 : -100)
                            }
                    }
                }
            }
            .ignoresSafeArea()
            .scrollTargetLayout()
            .scrollTargetBehavior(.viewAligned)
            .scrollBounceBehavior(.basedOnSize)
            .scrollPosition(id: $scrollPosition, anchor: .center)
            .animation(.smooth, value: scrollPosition)
        }
    }
}

#Preview {
    ScrollViewPaging()
}

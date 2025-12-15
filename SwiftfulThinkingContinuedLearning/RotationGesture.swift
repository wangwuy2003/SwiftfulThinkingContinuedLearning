//
//  RotationGesture.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 15/12/25.
//

import SwiftUI

struct RotationGesture: View {
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.white)
            .font(.largeTitle)
            .bold()
            .padding(50)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        angle = value.rotation
                    }
                    .onEnded { value in
                        withAnimation(.spring) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGesture()
}

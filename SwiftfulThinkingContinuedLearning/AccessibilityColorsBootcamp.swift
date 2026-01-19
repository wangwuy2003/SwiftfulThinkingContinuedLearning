//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    
                } label: {
                    Text("Button 1")
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)

                Button {
                    
                } label: {
                    Text("Button 2")
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button {
                    
                } label: {
                    Text("Button 3")
                }
                .foregroundStyle(.white)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button {
                    
                } label: {
                    Text("Button 4")
                }
                .foregroundStyle(differentiateWithoutColor ? .white : .green)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWithoutColor ? .black : .purple)
            }
            .font(.largeTitle)
            .navigationTitle("Hi")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
//            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
        
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}

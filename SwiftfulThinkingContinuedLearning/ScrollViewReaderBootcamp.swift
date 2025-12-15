//
//  ScrollViewBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 15/12/25.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    @State var scrollToIndex: Int = 0
    @State var textfieldText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a number here...", text: $textfieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll now") {
                withAnimation(.spring) {
                    if let index = Int(textfieldText) {
                        scrollToIndex = index
                    }
//                    proxy.scrollTo(30, anchor: .center)
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("this is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}

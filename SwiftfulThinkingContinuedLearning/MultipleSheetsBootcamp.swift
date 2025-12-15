//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 15/12/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    
}

/*
 1. Use binding
 2. Use multiple .sheets
 3. Use $item
 */

struct MultipleSheetsBootcamp: View {
    @State var selectedModel: RandomModel? = nil
    
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                Button("Button \(index)") {
                    selectedModel = RandomModel(title: "\(index)")
                }
            }
            .font(.title)
            .padding()
            .shadow(radius: 10)
            .frame(maxWidth: .infinity)
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
//        .sheet(isPresented: $showSheet) {
//            NextScreen(selectedModel: selectedModel)
//        }
    }
}

struct NextScreen: View {
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}

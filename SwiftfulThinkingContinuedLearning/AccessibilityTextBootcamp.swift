//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 19/1/26.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        
                        Text("This is some longer text that expands to multiple line.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(dynamicTypeSize.customScaleFactor)
                    }
//                    .frame(height: 100)
                    .background(.red)
                }
            }
            .navigationTitle("Hello World!")
            .listStyle(PlainListStyle())
        }
    }
}

extension DynamicTypeSize {
    var customScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium:
            return 1.0
        case .large, .xLarge, .xxLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}

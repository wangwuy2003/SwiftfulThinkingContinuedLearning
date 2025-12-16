//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 16/12/25.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    let subTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subTitle)
    }
    
}

struct HashableBootcamp: View {
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE", subTitle: "123"),
        MyCustomModel(title: "TWO", subTitle: "123"),
        MyCustomModel(title: "THREE", subTitle: "123"),
        MyCustomModel(title: "FOUR", subTitle: "123"),
        MyCustomModel(title: "FIVE", subTitle: "123"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}

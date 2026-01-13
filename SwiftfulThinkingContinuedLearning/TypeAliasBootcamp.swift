//
//  TypeAliasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Apple on 13/1/26.
//
import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
    @State var item: TVModel = TVModel(title: "Title", director: "Joe", count: 5)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypeAliasBootcamp()
}

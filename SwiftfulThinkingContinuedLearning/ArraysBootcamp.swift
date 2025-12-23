//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Apple on 17/12/25.
//

import SwiftUI
internal import Combine

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick", points: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 12, isVerified: false)
        let user4 = UserModel(name: nil, points: 24, isVerified: true)
        let user5 = UserModel(name: "Phank", points: 12, isVerified: true)
        let user6 = UserModel(name: "Jack", points: 25, isVerified: false)
        let user7 = UserModel(name: "Seven", points: 54, isVerified: false)
        let user8 = UserModel(name: "Kaoh", points: 32, isVerified: true)
        let user9 = UserModel(name: "Amanda", points: 63, isVerified: false)
        let user10 = UserModel(name: "Sophie", points: 24, isVerified: true)
        
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10,
        ])
    }
    
    func updateFilteredArray() {
        // sort
        // filter
        // map
        
        // sort
        /*
        filteredArray = dataArray.sorted { user1, user2 in
            return user1.points > user2.points
        }
        
        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
         */

        //filter
        /*
         
         
        filteredArray = dataArray.filter({ user -> Bool in
            return user.isVerified
        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
         */
        
        // map
        /*
        mappedArray = dataArray.map({ user -> String in
            return user.name ?? "ERROR"
        })
        
        mappedArray = dataArray.map({ $0.name })
        
        mappedArray = dataArray.compactMap({ user -> String? in
            return user.name
        })
        
        mappedArray = dataArray.compactMap({ $0.name })
         */
        
        let sort = dataArray.sorted(by: { $0.points > $1.points })
        let filter = dataArray.filter({ $0.isVerified })
        let map = dataArray.compactMap({ $0.name })
        
        mappedArray = dataArray
                        .sorted(by: { $0.points > $1.points })
                        .filter({ $0.isVerified })
                        .compactMap({ $0.name })
    }
}

struct ArraysBootcamp: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading, ) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}

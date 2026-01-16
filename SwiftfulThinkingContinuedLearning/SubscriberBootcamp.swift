//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 16/1/26.
//

import SwiftUI
internal import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    @Published var isOn: Bool = false
    
    init() {
        setUpTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                text.count > 3 ? true : false
            }
//            .assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else {
                    return
                }
                
                self.count += 1
                
                //                if self.count >= 5 {
                //                    for item in cancellables {
                //                        item.cancel()
                //                    }
                //                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count, $isOn)
            .sink { [weak self] (isValid, count, isOn) in
                guard let self else {
                    return
                }
                
                if isValid && count >= 10 && isOn == true {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberBootcamp: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .frame(height: 55)
                .padding(.leading)
                .font(.headline)
                .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .trailing) {
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundStyle(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0 : 1)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(.green)
                            .opacity(vm.textIsValid ? 1 : 0)
                    }
                    .font(.title)
                    .padding(.trailing)
                }
            
            Toggle("I agree to terms", isOn: $vm.isOn)
            
            Button {
                print("tapped")
            } label: {
                Text("Submit".uppercased())
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .opacity(vm.showButton ? 1.0 : 0.5)
                  
            }
            .disabled(!vm.showButton)

        }
        .padding()
    }
}

#Preview {
    SubscriberBootcamp()
}

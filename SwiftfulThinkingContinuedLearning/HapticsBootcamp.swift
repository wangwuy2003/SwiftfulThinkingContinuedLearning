//
//  HapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by MacMini A6 on 15/12/25.
//

import SwiftUI

class HapticManager {
    static let shared = HapticManager()
    
    private init() {
        
    }
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("Success") {
                HapticManager.shared.notification(type: .success)
            }
            Button("Error") {
                HapticManager.shared.notification(type: .error)
            }
            Button("Warning") {
                HapticManager.shared.notification(type: .warning)
            }
            
            Divider()
            
            Button("heavy") {
                HapticManager.shared.impact(style: .heavy)
            }
            Button("light") {
                HapticManager.shared.impact(style: .light)
            }
            Button("medium") {
                HapticManager.shared.impact(style: .medium)
            }
            Button("rigid") {
                HapticManager.shared.impact(style: .rigid)
            }
            Button("soft") {
                HapticManager.shared.impact(style: .soft)
            }
        }
    }
}

#Preview {
    HapticsBootcamp()
}

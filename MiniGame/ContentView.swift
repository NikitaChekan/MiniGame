//
//  ContentView.swift
//  MiniGame
//
//  Created by Nikita Chekan on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    
    @State private var alertPresented = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                HStack {
                    Text("0")
                    CustomSliderView(
                        value: $currentValue,
                        alpha: computeScore(),
                        color: .blue
                    )
                    Text("100")
                }
                .padding()
                
                Button("Проверь меня!") { alertPresented.toggle() }
                    .alert("Your Score:", isPresented: $alertPresented, actions: {}) {
                        Text(computeScore().formatted())
                    }
                Button("Начать заново") {
                    targetValue = Int.random(in: 0...100)
                    currentValue = 50
                }
            }
            .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

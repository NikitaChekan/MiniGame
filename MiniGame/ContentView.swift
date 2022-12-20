//
//  ContentView.swift
//  MiniGame
//
//  Created by Nikita Chekan on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 16) {
                Text("SLIDER VALUE: \(currentValue)") /// Удалить
                Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
                Slider(currentValue: $currentValue)
                Button("Проверь меня!") {
                }
                Button("Начать заново") {
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

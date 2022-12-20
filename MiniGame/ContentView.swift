//
//  ContentView.swift
//  MiniGame
//
//  Created by Nikita Chekan on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var targetValue = 0
    @State var currentValue = 0
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 16) {
                Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
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

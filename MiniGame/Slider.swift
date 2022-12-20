//
//  SliderView.swift
//  MiniGame
//
//  Created by Nikita Chekan on 20.12.2022.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .green
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeDone),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = .blue.withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
    
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func changeDone(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        Slider(currentValue: .constant(66), opacity: 50)
    }
}

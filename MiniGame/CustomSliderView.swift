//
//  CustomSliderView.swift
//  MiniGame
//
//  Created by Nikita Chekan on 20.12.2022.
//

import SwiftUI

struct CustomSliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
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
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $value)
    }
    
}

extension CustomSliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(currentValue: Binding<Double>) {
            self._value = currentValue
        }
        
        @objc func changeDone(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView(value: .constant(66), alpha: 50, color: .blue)
    }
}

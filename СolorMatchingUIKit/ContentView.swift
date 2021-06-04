//
//  ContentView.swift
//  СolorMatchingUIKit
//
//  Created by 18316409 on 04.06.2021.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var inputColor = Int.random(in: 0...255)
    @State private var userName = ""
    
    var body: some View {
        ZStack {
            Color(.brown)
                .ignoresSafeArea()
            VStack {
                ColorView(color: .gray)
                    .padding()
                ColorSlider(value: $sliderValue, color: .red)
                ColorSlider(value: $sliderValue, color: .green)
                ColorSlider(value: $sliderValue, color: .blue)
                
                TextField("Enter your name", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ColorSlider: View {
    @Binding var value: Double
    
//    @Binding var valColor: Int
    private let inputColor = Int.random(in: 0...255)
    
    let color: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("\(inputColor)", text: $valColor)
        }
        .padding(.horizontal)
    }
}

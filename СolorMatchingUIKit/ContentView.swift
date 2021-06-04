//
//  ContentView.swift
//  СolorMatchingUIKit
//
//  Created by 18316409 on 04.06.2021.
//

import SwiftUI


struct ContentView: View {
    
    @State private var sliderValueRed = Double.random(in: 0...255)
    @State private var sliderValueGreen = Double.random(in: 0...255)
    @State private var sliderValueBlue = Double.random(in: 0...255)
    @State private var valColorRed = ""
    @State private var valColorGreen = ""
    @State private var valColorBlue = ""
    
    var body: some View {
        ZStack {
            Color(.brown)
                .ignoresSafeArea()
            VStack {
                ColorView(color: .init(
                            red: sliderValueRed,
                            green: sliderValueGreen,
                            blue: sliderValueBlue,
                            opacity: 1)
                )
                    .padding()
                HStack {
                    ColorSlider(value: $sliderValueRed, color: .red)
                    TextField("\(lround(sliderValueRed))", text: $valColorRed)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                }
                HStack {
                    ColorSlider(value: $sliderValueGreen, color: .green)
                    TextField("\(lround(sliderValueGreen))", text: $valColorGreen)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                }
                HStack {
                    ColorSlider(value: $sliderValueBlue, color: .blue)
                    TextField("\(lround(sliderValueBlue))", text: $valColorBlue)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.trailing)
                }
                Spacer()
            }
            
        }
        
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let color: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(color)
            Slider(value: $value, in: 0...255, step: 1)            
        }
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



/* private func setColor() {
    colorView.backgroundColor = UIColor(
        red: CGFloat(redSlider.value),
        green: CGFloat(greenSlider.value),
        blue: CGFloat(blueSlider.value),
        alpha: 1
    )
}
*/

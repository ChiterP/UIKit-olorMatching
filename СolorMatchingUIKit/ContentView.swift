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
                            red: (sliderValueRed/255),
                            green: (sliderValueGreen/255),
                            blue: (sliderValueBlue/255))
                )
                .padding()
                HStack {
                    ColorSlider(value: $sliderValueRed, color: .red)
                    TextFieldInput(
                        valColor: $valColorRed,
                        sliderValue: $sliderValueRed,
                        alertPresented: false)
                }
                HStack {
                    ColorSlider(value: $sliderValueGreen, color: .green)
                    TextFieldInput(
                        valColor: $valColorGreen,
                        sliderValue: $sliderValueGreen,
                        alertPresented: false)
                }
                HStack {
                    ColorSlider(value: $sliderValueBlue, color: .blue)
                    TextFieldInput(
                        valColor: $valColorBlue,
                        sliderValue: $sliderValueBlue,
                        alertPresented: false)
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
            Text("\(lround(value))").foregroundColor(color)
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

struct TextFieldInput: View {
    
    @Binding var valColor: String
    @Binding var sliderValue: Double
    @State var alertPresented: Bool
    
    var body: some View {
        TextField(("\(lround(sliderValue))"), text: $valColor,
                  onCommit: {
                    sliderValue = Double(valColor) ?? 999
                    if sliderValue == 999 {
                        sliderValue = 0
                        valColor = "0"
                        alertPresented = true
                        return
                    }
                  })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 60, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.trailing)
            .alert(isPresented: $alertPresented){
                Alert(title: Text("Wrong Format!"),
                      message: Text("Enter the number"))
            }
    }
}

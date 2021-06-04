//
//  ColorView.swift
//  СolorMatchingUIKit
//
//  Created by 18316409 on 04.06.2021.
//

import SwiftUI



struct ColorView: View {
    let color: Color
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: 320, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColorView(color: .red)
        }
    }
}


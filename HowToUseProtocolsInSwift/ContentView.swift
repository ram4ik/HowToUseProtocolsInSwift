//
//  ContentView.swift
//  HowToUseProtocolsInSwift
//
//  Created by ramil on 21.10.2021.
//

import SwiftUI

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct ContentView: View {
    
    let colorTheme: ColorThemeProtocol
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text("Protocols are awesome!")
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(colorTheme: DefaultColorTheme())
            ContentView(colorTheme: AlternativeColorTheme())
        }
    }
}

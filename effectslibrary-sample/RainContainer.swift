//
//  RainContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 30.05.22.
//

import SwiftUI
import EffectsLibrary

enum RainExample: String, CaseIterable {
    case regular, intense, subtle, branded, reversed
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .regular:
            RainView()
        case .intense:
            RainView(
                config: RainConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        case .subtle:
            RainView(
                config: RainConfig(
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .slow,
                    fadeOut: .fast
                )
            )
        case .branded:
            RainView(
                config: RainConfig(
                    content: [
                        .image(UIImage(named: "stream-logo-blue")!, UIColor(Color.blue.opacity(0.4)), 0.05),
                        .image(UIImage(named: "stream-logo-white")!, UIColor(Color.white.opacity(0.4)), 0.05),
                        .image(UIImage(named: "stream-logo-black")!, UIColor(Color.black.opacity(0.4)), 0.05),
                        .emoji("💧", 0.2)
                    ],
                    backgroundColor: .blue.opacity(0.3),
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .fast,
                    fadeOut: .medium,
                    spreadRadius: .high
                )
            )
        case .reversed:
            RainView(
                config: RainConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none,
                    emitterPosition: .bottom,
                    fallDirection: .upwards
                )
            )
        }
    
        
    }
}

struct RainContainer: View {
    
    @State private var currentExample: RainExample = .regular
    
    var body: some View {
        ZStack {
            currentExample.view()
            
            ScrollView {
                ForEach(RainExample.allCases, id: \.self) { example in
                    Button {
                        currentExample = example
                    } label: {
                        Text(example.rawValue.capitalized)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .overlay(
                        example == currentExample ?
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.accentColor, lineWidth: 4)
                        : nil
                    )
                    .padding()
                }
            }
        }
        .navigationTitle("Fireworks examples")
    }
}
struct RainContainer_Previews: PreviewProvider {
    static var previews: some View {
        RainContainer()
    }
}

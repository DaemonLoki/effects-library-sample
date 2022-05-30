//
//  SnowContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 30.05.22.
//

import SwiftUI
import EffectsLibrary

enum SnowExample: String, CaseIterable {
    case regular, intense, subtle, branded, reversed
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .regular:
            SnowView()
        case .intense:
            SnowView(
                config: SnowConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        case .subtle:
            SnowView(
                config: SnowConfig(
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .slow,
                    fadeOut: .fast
                )
            )
        case .branded:
            SnowView(
                config: SnowConfig(
                    content: [
                        .image(UIImage(named: "stream-logo-blue")!, UIColor(Color.blue.opacity(0.4)), 0.3),
                        .image(UIImage(named: "stream-logo-white")!, UIColor(Color.white.opacity(0.4)), 0.3),
                        .image(UIImage(named: "stream-logo-black")!, UIColor(Color.black.opacity(0.4)), 0.3),
                        .emoji("❄️", 0.2)
                    ],
                    backgroundColor: .black.opacity(0.1),
                    intensity: .high,
                    lifetime: .short,
                    initialVelocity: .fast,
                    fadeOut: .medium,
                    spreadRadius: .high
                )
            )
        case .reversed:
            SnowView(
                config: SnowConfig(
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

struct SnowContainer: View {
    
    @State private var currentExample: SnowExample = .regular
    
    var body: some View {
        ZStack {
            currentExample.view()
            
            ScrollView {
                ForEach(SnowExample.allCases, id: \.self) { example in
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

struct SnowContainer_Previews: PreviewProvider {
    static var previews: some View {
        SnowContainer()
    }
}

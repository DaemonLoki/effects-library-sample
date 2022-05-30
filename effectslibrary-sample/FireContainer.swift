//
//  FireContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 30.05.22.
//

import SwiftUI
import EffectsLibrary

enum FireExample: String, CaseIterable {
    case regular, intense, subtle, branded
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .regular:
            FireView()
        case .intense:
            FireView(
                config: FireConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        case .subtle:
            FireView(
                config: FireConfig(
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .slow,
                    fadeOut: .fast
                )
            )
        case .branded:
            FireView(
                config: FireConfig(
                    content: [
                        .image(UIImage(named: "stream-logo-blue")!, .blue, 0.05),
                        .image(UIImage(named: "stream-logo-white")!, .white, 0.05),
                        .image(UIImage(named: "stream-logo-black")!, .black, 0.05),
                        .emoji("🔥", 1)
                    ],
                    backgroundColor: .blue.opacity(0.3),
                    intensity: .low,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none,
                    spreadRadius: .high
                )
            )
        }
    }
}

struct FireContainer: View {
    
    @State private var currentExample: FireExample = .regular
    
    var body: some View {
        ZStack {
            currentExample.view()
            
            ScrollView {
                ForEach(FireExample.allCases, id: \.self) { example in
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

struct FireContainer_Previews: PreviewProvider {
    static var previews: some View {
        FireContainer()
    }
}

//
//  ConfettiContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 30.05.22.
//

import SwiftUI
import EffectsLibrary

enum ConfettiExample: String, CaseIterable {
    case regular, intense, subtle, branded
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .regular:
            ConfettiView()
        case .intense:
            ConfettiView(
                config: ConfettiConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        case .subtle:
            ConfettiView(
                config: ConfettiConfig(
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .slow,
                    fadeOut: .fast
                )
            )
        case .branded:
            ConfettiView(
                config: ConfettiConfig(
                    content: [
                        .image(UIImage(named: "stream-logo-blue")!, nil, 0.1),
                        .image(UIImage(named: "stream-logo-white")!, nil, 0.1),
                        .image(UIImage(named: "stream-logo-black")!, nil, 0.1),
                    ],
                    backgroundColor: .blue.opacity(0.3),
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        }
    }
}

struct ConfettiContainer: View {
    
    @State private var currentExample: ConfettiExample = .regular
    
    var body: some View {
        ZStack {
            currentExample.view()
            
            ScrollView {
                ForEach(ConfettiExample.allCases, id: \.self) { example in
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
        .navigationTitle("Confetti examples")
    }
}

struct ConfettiContainer_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiContainer()
    }
}

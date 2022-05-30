//
//  SmokeContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 30.05.22.
//

import SwiftUI
import EffectsLibrary

enum SmokeExample: String, CaseIterable {
    case regular, intense, subtle, branded
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .regular:
            SmokeView()
        case .intense:
            SmokeView(
                config: SmokeConfig(
                    intensity: .high,
                    lifetime: .long,
                    initialVelocity: .fast,
                    fadeOut: .none
                )
            )
        case .subtle:
            SmokeView(
                config: SmokeConfig(
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .slow,
                    fadeOut: .fast
                )
            )
        case .branded:
            SmokeView(
                config: SmokeConfig(
                    content: [
                        .image(UIImage(named: "stream-logo-blue")!, UIColor(Color.blue.opacity(0.4)), 0.05),
                        .image(UIImage(named: "stream-logo-white")!, UIColor(Color.white.opacity(0.4)), 0.05),
                        .image(UIImage(named: "stream-logo-black")!, UIColor(Color.black.opacity(0.4)), 0.05),
                        .emoji("🔥", 1)
                    ],
                    backgroundColor: .blue.opacity(0.3),
                    intensity: .low,
                    lifetime: .short,
                    initialVelocity: .fast,
                    fadeOut: .medium,
                    spreadRadius: .high
                )
            )
        }
    }
}

struct SmokeContainer: View {
    
    @State private var currentExample: SmokeExample = .regular
    
    var body: some View {
        ZStack {
            currentExample.view()
            
            ScrollView {
                ForEach(SmokeExample.allCases, id: \.self) { example in
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
struct SmokeContainer_Previews: PreviewProvider {
    static var previews: some View {
        SmokeContainer()
    }
}

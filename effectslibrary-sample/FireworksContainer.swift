//
//  FireworksContainer.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI
import EffectsLibrary

enum FireworksExample: String, CaseIterable {
    case regular, intense, subtle, branded
}

struct FireworksContainer: View {
    
    @State private var currentExample: FireworksExample = .regular
    
    var body: some View {
        ZStack {
            switch currentExample {
            case .regular:
                FireworksView()
            case .intense:
                FireworksView(
                    config: FireworksConfig(
                        intensity: .high,
                        lifetime: .long,
                        initialVelocity: .fast,
                        fadeOut: .none
                    )
                )
            case .subtle:
                FireworksView(
                    config: FireworksConfig(
                        intensity: .low,
                        lifetime: .short,
                        initialVelocity: .slow,
                        fadeOut: .fast
                    )
                )
            case .branded:
                FireworksView(
                    config: FireworksConfig(
                        content: [.image(UIImage(named: "stream-logo")!, nil, 0.4)],
                        backgroundColor: .blue.opacity(0.3),
                        intensity: .high,
                        lifetime: .long,
                        initialVelocity: .fast,
                        fadeOut: .none
                    )
                )
            }
            
            ScrollView {
                ForEach(FireworksExample.allCases, id: \.self) { example in
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

struct FireworksContainer_Previews: PreviewProvider {
    static var previews: some View {
        FireworksContainer()
    }
}

//
//  NavigationEffect.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI
import EffectsLibrary

enum NavigationEffect: String, CaseIterable {
    case fireworks, confetti, fire, smoke, rain, snow
    
    @ViewBuilder func view() -> some View {
        switch self {
        case .fireworks:
            FireworksContainer()
        case .confetti:
            ConfettiContainer()
        case .fire:
            FireContainer()
        case .smoke:
            SmokeContainer()
        case .rain:
            RainContainer()
        case .snow:
            SnowContainer()
        }
    }
    
    var title: String {
        return "\(self.rawValue.capitalized) Effect"
    }
}

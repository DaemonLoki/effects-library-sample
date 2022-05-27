//
//  ContentView.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI

struct ContentView: View {
    
    let effects: [NavigatableEffect] = [
        NavigatableEffect(name: "Fireworks Effect", destination: Text("FireworksView")),
        NavigatableEffect(name: "Confetti Effect", destination: Text("ConfettiView")),
        NavigatableEffect(name: "Rain Effect", destination: Text("RainView")),
        NavigatableEffect(name: "Snow Effect", destination: Text("SnowView")),
        NavigatableEffect(name: "Fire Effect", destination: Text("FireView")),
        NavigatableEffect(name: "Smoke Effect", destination: Text("SmokeView")),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(effects) { effect in
                    NavigationLink(effect.name, destination: effect.destination)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("EffectsLibrary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

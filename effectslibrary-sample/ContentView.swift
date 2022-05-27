//
//  ContentView.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI
import EffectsLibrary

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(NavigationEffect.allCases, id: \.self.rawValue) { effect in
                    NavigationLink(
                        effect.title,
                        destination: effect.view()
                            .navigationTitle(effect.title)
                    )
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

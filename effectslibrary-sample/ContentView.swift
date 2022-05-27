//
//  ContentView.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Fireworks Effect", destination: Text("FireworksView"))
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

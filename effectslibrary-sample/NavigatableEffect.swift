//
//  NavigatableEffect.swift
//  effectslibrary-sample
//
//  Created by Stefan Blos on 27.05.22.
//

import SwiftUI

struct NavigatableEffect<V: View>: Identifiable {
    var id = UUID()
    var name: String
    var destination: V
}

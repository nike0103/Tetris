//
//  ContentView.swift
//  Tetris
//
//  Created by Nikhil Kumar on 16/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PlayView(viewModel: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

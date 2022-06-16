//
//  TetrisButtonView.swift
//  Tetris
//
//  Created by Megha Sharma on 09/06/22.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct TetrisButtonView: View {
    let buttonTitle: String
    var body: some View {
        Button {
            print(buttonTitle)
        } label: {
            Text(buttonTitle)
        }
        .buttonStyle(GrowingButton())
    }
}

struct TetrisButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TetrisButtonView(buttonTitle: "Hello World")
    }
}

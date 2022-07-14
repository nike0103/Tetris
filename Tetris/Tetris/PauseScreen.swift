//
//  PauseScreen.swift
//  Tetris
//
//  Created by Rupali Rajput on 23/06/22.
//

import SwiftUI

struct PauseScreen: View {
    var body: some View {
        ZStack{
            GradientView()
            VStack{
                TetrisButtonView(buttonTitle: "Restart")
                TetrisButtonView(buttonTitle: "Continue")

            }
        }
    }
}

struct PauseScreen_Previews: PreviewProvider {
    static var previews: some View {
        PauseScreen()
    }
}

//
//  StartScreen.swift
//  Tetris
//
//  Created by Megha Sharma on 02/06/22.
//

import SwiftUI

struct StartScreen: View {
    var userName = "USER1234"
    var highScore = 1080
    
    var body: some View {
        ZStack{
            GradientView()
            VStack{
                Text("High Score").font(.headline).padding()
                Text("\(highScore)").font(.largeTitle).padding()

                Text("Welcome \(userName)").font(.largeTitle).padding()
                TetrisButtonView(buttonTitle: "Start Game")
            }
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

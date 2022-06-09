//
//  StartScreen.swift
//  Tetris
//
//  Created by Megha Sharma on 02/06/22.
//

import SwiftUI

struct StartScreen: View {
    @State var userName = "USER1234"
    @State private var animateGradient = true
    var highScore = 1080
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [ColourTheme.primaryColor, ColourTheme.secondaryColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .onAppear {
                        withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                }
            VStack{
                Text("High Score").font(.headline).padding()
                Text("\(highScore)").font(.largeTitle).padding()

                Text("Welcome \(userName)").font(.largeTitle).padding()
                TextField("Placeholder", text: $userName).multilineTextAlignment(.center).padding()
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

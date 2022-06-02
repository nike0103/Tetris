//
//  StartScreen.swift
//  Tetris
//
//  Created by Megha Sharma on 02/06/22.
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

struct StartScreen: View {
    @State var userName = "USER1234"
    @State private var animateGradient = true
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.purple, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .onAppear {
                        withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                }
            VStack{
                Text("High Score").font(.headline).padding()
                Text("1080").font(.largeTitle).padding()

                Text("Welcome \(userName)").font(.largeTitle).padding()
                TextField("Placeholder", text: $userName).multilineTextAlignment(.center).padding()
                Button("Start Game") {
                    print("Start Game")
                }
                .buttonStyle(GrowingButton())
            }
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}

//
//  Pause Screen.swift
//  Tetris
//
//  Created by Megha Sharma on 23/06/22.
//

import SwiftUI

struct Pause_Screen: View {
    @Environment(\.dismiss) var dismiss
    var onRestart: () -> Void
 
    var body: some View
    {
        ZStack{
            GradientView().blur(radius: 0.5, opaque: false)
            VStack {
                TetrisButtonView(buttonTitle: "Restart"){
                    onRestart()
                    dismiss()
                }
                TetrisButtonView(buttonTitle: "Resume")
                {
                    dismiss()
                }
            }
        }
    }
}

struct Pause_Screen_Previews: PreviewProvider {
    static var previews: some View {
        //Pause_Screen(isPresented: true)
        Text("hi")
    }
}

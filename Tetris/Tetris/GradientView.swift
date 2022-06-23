//
//  GradientView.swift
//  Tetris
//
//  Created by Megha Sharma on 09/06/22.
//

import SwiftUI

struct GradientView: View {
    @State private var animateGradient = false
    
    var body: some View {
        LinearGradient(colors: [.primaryColor, .secondaryColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient = false
                    }
            }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}

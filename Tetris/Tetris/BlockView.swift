//
//  BlockView.swift
//  Tetris
//
//  Created by Sharad Jain on 02/06/22.
//

import SwiftUI

struct BlockView: View {
    @Binding var state: Int
    
    var body: some View {
        HStack {
            state == 1 ? Color.gray : Color.white
        }.border(.black, width: 0.2)
        .shadow(color: .black, radius: 3.0, x: 0, y: 0)
    }
}

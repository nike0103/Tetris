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
        state == 1 ? Color.gray : Color.white
    }
}

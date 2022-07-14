import SwiftUI

struct TetrisView: View {
    var scoreManager: String = ""
    
    var blockManager: String = ""
    
    @State var isPaused: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            HStack {
                ScoreView()
                RandomBlockView()
                PauseButton()
            }
            .frame(width: UIScreen.main.bounds.size.width, height: 100, alignment: .center)
            PlayView(viewModel: PlaygroundViewModel())
                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 150, alignment: .center)
                .border(.black)
        }
    }
}

private struct ScoreView: View {
    var body: some View {
        Text("Score - 1180")
            .padding()
            .foregroundColor(.white)
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Rectangle())
    }
}

 private struct RandomBlockView: View {
    var body: some View {
        Text("Random Block")
            .foregroundColor(.white)
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
    }
}

private struct PauseButton: View {
    var body: some View {
        Button(action: {
            print("Game Paused")
        }, label: {
            Text("Pause")
                .foregroundColor(Color.white)
        })
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .clipShape(Capsule())
    }
}

struct TetrisView_Previews: PreviewProvider {
    static var previews: some View {
        TetrisView()
    }
}

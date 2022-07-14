import SwiftUI

struct PlayView: View {
    @ObservedObject var viewModel: PlaygroundViewModel
    @State private var isPauseScreenPresented = false
    @Environment(\.dismiss) var dismiss
    
    var rows: Int {
        viewModel.matrix.count
    }
    var columns: Int {
        viewModel.matrix.first?.count ?? 0
    }

    var body: some View {
        HStack{
            Spacer()
            TetrisButtonView(buttonTitle: "Exit") {
                dismiss()
            }
            TetrisButtonView(buttonTitle: "Pause") {
                isPauseScreenPresented = true
            }.fullScreenCover(isPresented: $isPauseScreenPresented, onDismiss: nil) {
                Pause_Screen {
                    viewModel.restart()
                }
            }
        }
        GeometryReader { frame in
            VStack(spacing: 0) {
                Spacer()
                ForEach((0..<rows), id:\.self) { row in
                    HStack(spacing: 0) {
                        ForEach((0..<columns), id:\.self) { column in
                            BlockView(state: viewModel.matrix[row][column])
                                .frame(width: frame.size.width/CGFloat(columns), height: frame.size.width/CGFloat(columns))
                                .onTapGesture {
                                    viewModel.tap()
                                }
                        }
                    }
                }
            }
        }.ignoresSafeArea()
            .onAppear(perform: viewModel.onViewAppear)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(viewModel: .init())
    }
}

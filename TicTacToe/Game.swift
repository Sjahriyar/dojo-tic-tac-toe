import SwiftUI

enum Player {
    case x, o
}

class Game {
    var board: [[String]]
    var currentPlayer: Player

    init() {
        self.board = [[" ", " ", " "],
                      [" ", " ", " "],
                      [" ", " ", " "]]
        self.currentPlayer = .x
    }

    func makeMove(row: Int, column: Int) {
        guard board[row][column] == " " else { return }
        board[row][column] = currentPlayer == .x ? "X" : "O"
    }
}

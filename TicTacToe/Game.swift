import SwiftUI

enum Player: String {
    case x = "X", o = "O"
}

class Game {
    var board: [[String]]
    var currentPlayer: Player
    var winner: Player?

    init() {
        self.board = [[" ", " ", " "],
                      [" ", " ", " "],
                      [" ", " ", " "]]
        self.currentPlayer = .x
    }

    func makeMove(row: Int, column: Int) {
        guard board[row][column] == " " else { return }
        board[row][column] = currentPlayer == .x ? "X" : "O"
        checkForWinner()
        currentPlayer = (currentPlayer == .x) ? .o : .x
    }

    private func checkForWinner() {
        // Check vertical columns
        for col in 0..<3 {
            if board[0][col] == currentPlayer.rawValue &&
                board[1][col] == currentPlayer.rawValue &&
                board[2][col] == currentPlayer.rawValue {
                winner = currentPlayer
            }
        }
    }
}

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
        board[row][column] = currentPlayer.rawValue
        checkForWinner()
        if winner == nil && !isDraw() {
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }

    private func checkForWinner() {
        // Check vertical columns
        for col in 0..<3 {
            if board[0][col] == currentPlayer.rawValue &&
                board[1][col] == currentPlayer.rawValue &&
                board[2][col] == currentPlayer.rawValue {
                winner = currentPlayer
                return
            }
        }

        // Check horizontal rows
        for row in 0..<3 {
            if board[row][0] == currentPlayer.rawValue &&
                board[row][1] == currentPlayer.rawValue &&
                board[row][2] == currentPlayer.rawValue {
                winner = currentPlayer
                return
            }
        }

        // Check diagonals
        if board[0][0] == currentPlayer.rawValue &&
            board[1][1] == currentPlayer.rawValue &&
            board[2][2] == currentPlayer.rawValue {
            winner = currentPlayer
            return
        }

        if board[0][2] == currentPlayer.rawValue &&
            board[1][1] == currentPlayer.rawValue &&
            board[2][0] == currentPlayer.rawValue {
            winner = currentPlayer
            return
        }
    }

    func isDraw() -> Bool {
        guard winner == nil else { return false }

        for row in board {
            if row.contains(" ") {
                return false // There is still an empty spot
            }
        }

        return true
    }
}

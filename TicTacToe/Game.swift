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
}

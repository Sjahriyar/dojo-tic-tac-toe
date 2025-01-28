//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Nami on 28/01/2025.
//

import XCTest
@testable import TicTacToe

final class TicTacToeTests: XCTestCase {

    func testInitialBoardIsEmpty() {
        let game = Game()
        let expectedBoard = [[" ", " ", " "],
                             [" ", " ", " "],
                             [" ", " ", " "]]
        XCTAssertEqual(game.board, expectedBoard)
    }

    func testGameStartsWithPlayerX() {
        let game = Game()
        XCTAssertEqual(game.currentPlayer, .x)
    }

    func testPlayerXCanPlaceMarker() {
        let game = Game()
        game.makeMove(row: 0, column: 0) // X
        XCTAssertEqual(game.board[0][0], "X")
    }
}

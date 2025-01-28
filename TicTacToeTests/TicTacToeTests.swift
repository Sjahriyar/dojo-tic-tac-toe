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

    func testTurnAlternatesAfterMove() {
        let game = Game()
        XCTAssertEqual(game.currentPlayer, .x)
        game.makeMove(row: 0, column: 0) // X
        XCTAssertEqual(game.currentPlayer, .o)
    }

    func testPlayerXWinsWithVerticalLine() {
        let game = Game()
        game.makeMove(row: 0, column: 0) // X
        game.makeMove(row: 0, column: 1) // O
        game.makeMove(row: 1, column: 0) // X
        game.makeMove(row: 1, column: 1) // O
        game.makeMove(row: 2, column: 0) // X - Winning move
        XCTAssertEqual(game.winner, .x)
    }

    func testGameDetectsWinnerWhenPlayerOWinsWithHorizontalLine() {
        let game = Game()
        game.makeMove(row: 0, column: 0) // X
        game.makeMove(row: 1, column: 0) // O
        game.makeMove(row: 0, column: 1) // X
        game.makeMove(row: 1, column: 1) // O
        game.makeMove(row: 2, column: 2) // X
        game.makeMove(row: 1, column: 2) // O
        XCTAssertEqual(game.winner, .o)
    }
}

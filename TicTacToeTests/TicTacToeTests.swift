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

    func testGameDetectsWinnerWhenPlayerXWinsWithDiagonalLine() {
        let game = Game()
        game.makeMove(row: 0, column: 0) // X
        game.makeMove(row: 0, column: 1) // O
        game.makeMove(row: 1, column: 1) // X
        game.makeMove(row: 1, column: 0) // O
        game.makeMove(row: 2, column: 2) // X
        XCTAssertEqual(game.winner, .x)
    }

    func testGameDetectsDrawWhenBoardIsFullAndNoWinner() {
        let game = Game()
        game.makeMove(row: 0, column: 0) // X
        game.makeMove(row: 0, column: 1) // O
        game.makeMove(row: 0, column: 2) // X
        game.makeMove(row: 1, column: 1) // O
        game.makeMove(row: 1, column: 0) // X
        game.makeMove(row: 1, column: 2) // O
        game.makeMove(row: 2, column: 1) // X
        game.makeMove(row: 2, column: 0) // O
        game.makeMove(row: 2, column: 2) // X

        XCTAssertNil(game.winner, "Winner should be nil in a draw scenario.")
        XCTAssertTrue(game.isDraw(), "The game should be a draw.")
    }

    func testGamePlaysInBotMode() {
        let game = Game()
        var moveCount = 0

        while game.winner == nil && !game.isDraw() {
            let row = Int.random(in: 0..<3)
            let column = Int.random(in: 0..<3)

            // Ensure the move is valid
            if game.board[row][column] == " " {
                game.makeMove(row: row, column: column)
                moveCount += 1
            }
        }

        XCTAssertTrue(game.isDraw())
    }
}

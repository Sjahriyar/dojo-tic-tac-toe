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
}

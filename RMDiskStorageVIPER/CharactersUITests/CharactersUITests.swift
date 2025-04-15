//
//  CharactersUITests.swift
//  CharactersUITests
//
//  Created by Ибрагим Габибли on 06.04.2025.
//

import XCTest

final class CharactersUITests: XCTestCase {
    private var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testCharactersTableViewExists() throws {
        let charactersTableView = app.tables.element(matching: .table, identifier: "charactersTableView")
        XCTAssertTrue(charactersTableView.exists)
    }

    func testCharactersTableCellExists() throws {
        let firstCell = app.tables.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.exists)

        let characterImageView = firstCell.images["characterImageView"]
        XCTAssertTrue(characterImageView.exists)

        let nameLabel = firstCell.staticTexts["nameLabel"]
        XCTAssertTrue(nameLabel.exists)

        let speciesAndGenderLabel = firstCell.staticTexts["speciesAndGenderLabel"]
        XCTAssertTrue(speciesAndGenderLabel.exists)

        let watchEpisodesButton = firstCell.buttons["watchEpisodesButton"]
        XCTAssertTrue(watchEpisodesButton.exists)

        let markerImageView = firstCell.images["markerImageView"]
        XCTAssertTrue(markerImageView.exists)

        let locationLabel = firstCell.staticTexts["locationLabel"]
        XCTAssertTrue(locationLabel.exists)

        let statusLabel = firstCell.staticTexts["statusLabel"]
        XCTAssertTrue(statusLabel.exists)
    }

    override func tearDownWithError() throws {
        app = nil
    }
}

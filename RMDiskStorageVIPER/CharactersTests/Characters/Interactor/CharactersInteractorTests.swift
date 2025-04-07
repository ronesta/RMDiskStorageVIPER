//
//  CharactersInteractorTests.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class CharactersInteractorTests: XCTestCase {
    private var interactor: CharactersInteractor!
    private var mockPresenter: MockPresenter!
    private var mockService: MockCharactersServiceForInteractor!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockService = MockCharactersServiceForInteractor()
        mockStorageManager = MockStorageManager()
        interactor = CharactersInteractor(charactersService: mockService,
                                          storageManager: mockStorageManager
        )
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockService = nil
        mockStorageManager = nil
        super.tearDown()
    }

    func testGetCharactersLoadSavedCharacters() {
        let savedCharacters = [
            Character(name: "Summer Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     ),
            Character(name: "Beth Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        mockStorageManager.saveCharacters(savedCharacters)

        interactor.getCharacters()

        XCTAssertEqual(mockPresenter.fetchedCharacters, savedCharacters)
        XCTAssertNil(mockPresenter.fetchError)
    }

    func testGetCharactersWhenCharactersAreNotSaved() {
        let fetchedCharacters = [
            Character(name: "Summer Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     ),
            Character(name: "Beth Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Female",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        mockService.resultToReturn = .success(fetchedCharacters)

        interactor.getCharacters()

        XCTAssertEqual(mockPresenter.fetchedCharacters, fetchedCharacters)
        XCTAssertNil(mockPresenter.fetchError)
        XCTAssertEqual(mockStorageManager.characters, fetchedCharacters)
    }

    func testGetCharactersSendsErrorToPresenterWhenServiceFails() {
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        mockService.resultToReturn = .failure(mockError)

        interactor.getCharacters()

        XCTAssertNotNil(mockPresenter.fetchError)
        XCTAssertNil(mockPresenter.fetchedCharacters)
        XCTAssertEqual(mockPresenter.fetchError as NSError?, mockError)
    }
}


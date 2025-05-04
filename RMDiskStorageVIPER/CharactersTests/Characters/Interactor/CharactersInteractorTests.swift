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
    private var mockService: MockCharactersService!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockService = MockCharactersService()
        mockStorageManager = MockStorageManager()
        interactor = CharactersInteractor(
            charactersService: mockService,
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

    func test_GivenSavedCharacters_WhenGetCharacters_ThenPresenterReceivesSavedCharacters() {
        // Given
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

        // When
        interactor.getCharacters()

        // Then
        XCTAssertEqual(mockPresenter.charactersFetchedCallCount, 1)
        XCTAssertEqual(mockPresenter.charactersFetchedArgsCharacters.first, savedCharacters)
        XCTAssertEqual(mockPresenter.charactersFetchFailedCallCount, 0)
    }

    func test_GivenNoSavedCharacters_WhenGetCharacters_ThenPresenterReceivesFetchedCharactersAndSavesThem() {
        // Given
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

        mockService.stubbedCharactersResult = .success(fetchedCharacters)

        // When
        interactor.getCharacters()

        // Then
        XCTAssertEqual(mockPresenter.charactersFetchedCallCount, 1)
        XCTAssertEqual(mockPresenter.charactersFetchedArgsCharacters.first, fetchedCharacters)
        XCTAssertEqual(mockPresenter.charactersFetchFailedCallCount, 0)
        XCTAssertEqual(mockStorageManager.characters, fetchedCharacters)

    }

    func test_GivenNoSavedCharacters_WhenGetCharactersFails_ThenPresenterReceivesError() {
        // Given
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        mockService.stubbedCharactersResult = .failure(mockError)

        // When
        interactor.getCharacters()

        // Then
        XCTAssertEqual(mockPresenter.charactersFetchFailedCallCount, 1)
        XCTAssertEqual(mockPresenter.charactersFetchFailedArgsErrors.first as NSError?, mockError)
        XCTAssertEqual(mockPresenter.charactersFetchedCallCount, 0)

    }
}

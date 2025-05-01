//
//  CharactersPresenterTests.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class CharactersPresenterTests: XCTestCase {
    private var presenter: CharactersPresenter!
    private var mockView: MockCharactersView!
    private var mockInteractor: MockInteractor!

    override func setUp() {
        super.setUp()
        mockView = MockCharactersView()
        mockInteractor = MockInteractor()
        presenter = CharactersPresenter(interactor: mockInteractor)
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testGivenPresenter_WhenViewDidLoad_ThenInteractorGetCharactersCalled() {
        // Given
        // Presenter initialized with mockInteractor

        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertTrue(mockInteractor.getCharactersCalled)
    }

    func testGivenFetchedCharacters_WhenCharactersFetched_ThenViewIsUpdatedWithCharacters() {
        // Given
        let mockCharacters = [
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

        // When
        presenter.charactersFetched(mockCharacters)

        // Then
        XCTAssertEqual(mockView.displayCharactersCallCount, 1)
        XCTAssertEqual(mockView.displayCharactersArgsCharacters.first, mockCharacters)
        XCTAssertEqual(mockView.displayErrorCallCount, 0)
    }

    func testGivenFetchFailure_WhenCharactersFetchFailed_ThenErrorIsShownInView() {
        // Given
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        // When
        presenter.charactersFetchFailed(with: mockError)

        // Then
        XCTAssertEqual(mockView.displayErrorCallCount, 1)
        XCTAssertEqual(mockView.displayCharactersCallCount, 0)
    }
}

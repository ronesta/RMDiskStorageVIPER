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

    func testViewDidLoadCallsInteractorGetCharacters() {
        presenter.viewDidLoad()

        XCTAssertTrue(mockInteractor.getCharactersCalled)
    }

    func testCharactersFetchedUpdateViewWithCharacters() {
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

        presenter.charactersFetched(mockCharacters)

        XCTAssertEqual(mockView.characters, mockCharacters)
    }

    func testCharactersFetchFailedShowsErrorInView() {
        let mockError = NSError(domain: "Test", code: 0, userInfo: nil)

        presenter.charactersFetchFailed(with: mockError)
        
        XCTAssertNotNil(mockView.errorMessage)
        XCTAssertNil(mockView.characters)
    }
}

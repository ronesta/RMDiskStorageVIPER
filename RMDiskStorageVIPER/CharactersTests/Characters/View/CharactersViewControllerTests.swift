//
//  CharactersViewControllerTests.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 07.04.2025.
//

import XCTest
import ViewControllerPresentationSpy
@testable import RMDiskStorageVIPER

final class CharactersViewControllerTests: XCTestCase {
    private var viewController: CharactersViewController!
    private var mockPresenter: MockPresenter!
    private var mockDataSource: MockDataSource!

    override func setUp() {
        super.setUp()
        mockPresenter = MockPresenter()
        mockDataSource = MockDataSource()
        viewController = CharactersViewController(presenter: mockPresenter,
                                                  dataSource: mockDataSource
        )
    }

    override func tearDown() {
        viewController = nil
        mockPresenter = nil
        mockDataSource = nil
        super.tearDown()
    }

    func testViewDidLoadCallsPresenterViewDidLoad() {
        viewController.viewDidLoad()

        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }

    func testSetupViews() {
        viewController.viewDidLoad()

        XCTAssertNotNil(viewController.tableView.dataSource)
        XCTAssertTrue(viewController.tableView.dataSource === mockDataSource)

        XCTAssertNotNil(viewController.tableView.delegate)
        XCTAssertTrue(viewController.tableView.delegate === viewController)
    }

    func testUpdateCharactersReloadsData() {
        let characters = [
            Character(name: "John Doe",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth"),
                      image: "image_url"
                     ),
            Character(name: "Morty Smith",
                      status: "Alive",
                      species: "Human",
                      gender: "Male",
                      location: Location(name: "Earth (C-137)"),
                      image: "url_to_image"
                     )
        ]

        viewController.displayCharacters(characters)

        XCTAssertEqual(mockDataSource.characters, characters)
    }

    @MainActor func testShowErrorDisplaysAlert() {
        let errorMessage = "Test Error"
        let alertVerifier = AlertVerifier()

        viewController.displayError(errorMessage)

        alertVerifier.verify(
            title: "Error",
            message: "Test Error",
            animated: true,
            actions: [
                .default("OK")
            ],
            presentingViewController: viewController
        )
    }
}

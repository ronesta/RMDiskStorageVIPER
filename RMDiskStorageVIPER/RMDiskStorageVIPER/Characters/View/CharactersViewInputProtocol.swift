//
//  CharacterViewProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol CharactersViewInputProtocol: AnyObject {
    func displayCharacters(_ characters: [Character])

    func displayError(_ message: String)
}

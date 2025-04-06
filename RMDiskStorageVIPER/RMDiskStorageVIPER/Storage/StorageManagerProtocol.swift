//
//  StorageManagerProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol StorageManagerProtocol {
    func saveCharacters(_ characters: [Character])

    func loadCharacters() -> [Character]?

    func saveImage(_ image: Data, key: String)

    func loadImage(key: String) -> Data?
}

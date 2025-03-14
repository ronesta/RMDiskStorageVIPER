//
//  CharactersServiceProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 14.03.2025.
//

import Foundation

protocol CharactersServiceProtocol {
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)
}

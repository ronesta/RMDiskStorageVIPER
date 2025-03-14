//
//  CharacterDataSourceProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit

protocol CharactersDataSourceProtocol: UITableViewDataSource {
    var characters: [Character] { get set }
}

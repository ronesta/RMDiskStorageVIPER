//
//  CharacterInteractorProtocol.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit.UIImage

protocol CharacterInteractorProtocol: AnyObject {
    func getCharacters()

    func loadImage(for character: Character, completion: @escaping (UIImage?) -> Void)
}

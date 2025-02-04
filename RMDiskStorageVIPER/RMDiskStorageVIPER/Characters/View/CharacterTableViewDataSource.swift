//
//  CharacterTableViewDataSource.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit

final class CharacterTableViewDataSource: NSObject, CharacterDataSourceProtocol {
    var networkManager: NetworkManagerProtocol?
    var characters = [Character]()

    init(networkManager: NetworkManagerProtocol?) {
        self.networkManager = networkManager
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.id,
            for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]
        let imageURL = character.image

        networkManager?.loadImage(from: imageURL) { loadedImage in
            DispatchQueue.main.async {
                guard let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell  else {
                    return
                }
                cell.configure(with: character, image: loadedImage)
            }
        }

        return cell
    }
}

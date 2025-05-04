//
//  NetworkManager.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation
import UIKit

final class CharactersService: CharactersServiceProtocol {
    private var counter = 1

    private let urlString = "https://rickandmortyapi.com/api/character"
    private let urlSession: URLSessionProtocol
    private let dispatchQueue: DispatchQueueProtocol

    init(urlSession: URLSessionProtocol = URLSession.shared,
         dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
    ) {
        self.urlSession = urlSession
        self.dispatchQueue = dispatchQueue
    }

    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(.failure(NetworkError.invalidURL))
            return
        }

        urlSession.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                self.dispatchQueue.async  {
                    completion(.failure(error))
                }
                return
            }

            guard let data else {
                print("No data")
                self.dispatchQueue.async {
                    completion(.failure(NetworkError.noData))
                }
                return
            }

            do {
                let character = try JSONDecoder().decode(PostCharacters.self, from: data)
                self.dispatchQueue.async {
                    completion(.success(character.results))
                    print("Load data \(self.counter)")
                    self.counter += 1
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                self.dispatchQueue.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

//
//  MockFileManager.swift
//  RMDiskStorageVIPER
//
//  Created by Ибрагим Габибли on 01.05.2025.
//

import XCTest
@testable import RMDiskStorageVIPER

final class MockFileManager: FileManager {
    private(set) var storage = [String: Data]()
    private(set) var shouldFail: Bool = false

    override func fileExists(atPath path: String) -> Bool {
        return storage[path] != nil
    }

    override func contents(atPath path: String) -> Data? {
        return storage[path]
    }

    override func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
        return [URL(fileURLWithPath: "/mock/Documents")]
    }

    override func createFile(atPath path: String, contents data: Data?, attributes attr: [FileAttributeKey : Any]? = nil) -> Bool {
        if shouldFail || path.contains("invalid") {
            return false
        }

        storage[path] = data
        return true
    }

    override func removeItem(at url: URL) throws {
        storage.removeValue(forKey: url.path)
    }

    override func contentsOfDirectory(at url: URL, includingPropertiesForKeys keys: [URLResourceKey]?, options mask: FileManager.DirectoryEnumerationOptions = []) throws -> [URL] {
        return storage.keys.compactMap { path in
            path.hasPrefix(url.path) ? URL(fileURLWithPath: path) : nil
        }
    }
}

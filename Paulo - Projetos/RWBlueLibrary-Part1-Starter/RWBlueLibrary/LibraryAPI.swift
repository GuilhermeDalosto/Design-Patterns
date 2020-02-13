//
//  LibraryAPI.swift
//  RWBlueLibrary
//
//  Created by Paulo Ricardo on 2/13/20.
//  Copyright © 2020 Razeware LLC. All rights reserved.
//

import Foundation


final class LibraryAPI {
    
    // Singleton --------------------
    static let shared = LibraryAPI()
    private init() { }
    // -------------------- Singleton
    
    
    
    // Facade ---------------------------------------------
    private let persistencyManager = PersistencyManager()
    private let httpClient = HTTPClient()
    private let isOnline = false
    
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    
    func addAlbum(_ album: Album, at index: Int) {
        persistencyManager.addAlbum(album, at: index)
        if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }
    }
    
    
    func deleteAlbum(at index: Int) {
        persistencyManager.deleteAlbum(at: index)
        if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }
    }
    // --------------------------------------------- Facade
}

//
//  MovieViewModel.swift
//  MVVM
//
//  Created by Guilherme Martins Dalosto de Oliveira on 24/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

import Foundation


class MovieViewModel : FetchDatabase {
    
    var moviesShelf : [String:String]?
    
    let moviesDatabase = MoviesDatabase()
    
    public init(){
        moviesShelf = getMovies()
    }
    
    public func getMovies() -> [String:String]{
        let allMovies: [String:String] = performFetch()
        return allMovies
    }
    
    func performFetch<T>() -> T {
        return self.moviesDatabase.movies as! T
    }    
}

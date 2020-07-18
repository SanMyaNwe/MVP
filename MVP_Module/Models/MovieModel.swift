//
//  MovieModel.swift
//  MVP_Module
//
//  Created by Riki on 7/18/20.
//  Copyright © 2020 SanMyaNwe. All rights reserved.
//

import Foundation

protocol MovieModelProtocol {
    
    func fetchNowPlayingMovies(
        success: @escaping(MovieListResponse)->Void,
        fail: @escaping(ApiServiceError)-> Void
    )
    
    func fetchUpComingMovies(
        success: @escaping(MovieListResponse)->Void,
        fail: @escaping(ApiServiceError)-> Void
    )
    
}

class MovieModel: MovieModelProtocol {
    
    static let shared = MovieModel()
    
    private init() {}
    
    func fetchNowPlayingMovies(
        success: @escaping(MovieListResponse)->Void,
        fail: @escaping(ApiServiceError)-> Void
    ) {
        
        ApiService.shared
            .fetchData(endpoint: .nowPlaying, value: MovieListResponse.self) { (result) in
                switch result {
                case .success(let response):
                    success(response)
                case .failure(let error):
                    fail(error)
                }
        }
        
    }
    
    func fetchUpComingMovies(success: @escaping (MovieListResponse) -> Void, fail: @escaping (ApiServiceError) -> Void) {
        
    }
    
    
}

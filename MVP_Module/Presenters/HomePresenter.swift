//
//  HomePresenter.swift
//  MVP_Module
//
//  Created by Riki on 7/18/20.
//  Copyright © 2020 SanMyaNwe. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    
    var mView: HomeView? { get set }
    
    func onViewDidLoad()
    func attachView(view: HomeView)
    
}

class HomePresenter: HomePresenterProtocol {
    
    var mView: HomeView?
    
    func onViewDidLoad() {
        MovieModel.shared.fetchNowPlayingMovies(success: { (response) in
            self.mView?.gotMovies(movies: response.results ?? [])
        }) { (error) in
            self.mView?.gotError(error: error.description)
        }
    }
    
    func attachView(view: HomeView) {
        mView = view
    }
    
}

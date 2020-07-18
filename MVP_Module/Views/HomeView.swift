//
//  HomeView.swift
//  MVP_Module
//
//  Created by Riki on 7/18/20.
//  Copyright © 2020 SanMyaNwe. All rights reserved.
//

import Foundation

protocol HomeView {
    
    func gotMovies(movies: [Movie])
    func gotError(error: String)
    
}

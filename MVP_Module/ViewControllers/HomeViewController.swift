//
//  HomeViewController.swift
//  MVP_Module
//
//  Created by Riki on 7/18/20.
//  Copyright © 2020 SanMyaNwe. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeView {
    
    static let id = "HomeViewController"
    
    private var mPresenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mPresenter.attachView(view: self)
//        mPresenter.mView = self
        mPresenter.onViewDidLoad()
    }
    
    func gotMovies(movies: [Movie]) {
        print(movies.count)
    }
    
    func gotError(error: String) {
        print(error)
    }
    
}

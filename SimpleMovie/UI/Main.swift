//
//  SimpleMovieApp.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import SwiftUI

@main
struct SimpleMovieApp: App {
    
    var body: some Scene {
        WindowGroup {
            PopularMovies(viewModel: .init())
        }
    }
}

//
//  PopularMovies.swift
//  SimpleMovie
//
//  Created by kirill on 8/5/2022.
//

import SwiftUI

struct PopularMovies: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List() {
                    ForEach(viewModel.state.movies) { movie in
                        NavigationLink(destination: MovieDetail(movieTitle: movie.title, viewModel: .init(movieId: movie.id))) {
                            MovieListItem(movie: movie)
                        }
                    }
                if viewModel.state.canLoadNextPage {
                    Button(action: {
                        viewModel.fetchNextPageIfPossible()
                    }) { Text("Load more movies") }
                        .accessibility(identifier: "loadMore")
                }
            }
            .navigationTitle("Popular Movies")
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        PopularMovies(viewModel: PopularMovies.ViewModel.init())
    }
}

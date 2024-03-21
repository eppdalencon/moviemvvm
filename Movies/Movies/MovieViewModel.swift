//
//  MovieViewModel.swift
//  Movies
//
//  Created by Eduardo Dalencon on 20/03/24.
//

import Foundation

protocol MovieViewModelDelegate: AnyObject {
    func didFinish()
    func didFail (error: Error)
}

class MovieViewModel{
    
    var nowPlaying = [Movie]()
    var popular = [Movie]()
    var sections: [Section] = Section.allCases
    
    weak var delegate: MovieViewModelDelegate?
    
    @MainActor
    func getMovies() {
        MovieService.loadData(page: 1, url: MovieService.urlStringNowPlaying){ parsedData in
            self.nowPlaying.append(contentsOf: parsedData)
            self.delegate?.didFinish()
            
        }
    }
    
    func getMoviesPopular() {
        MovieService.loadData(page: 1, url: MovieService.urlStringPopular){ parsedData in
            self.popular.append(contentsOf: parsedData)
            self.delegate?.didFinish()
            
        }
    }
    
    func getImages(url: String) {
        MovieService.getImage(urlString: url) { image, urlString in
            
            guard let movieIndex = self.nowPlaying.firstIndex(where: { $0.poster_path == urlString }) else { return }
            self.nowPlaying[movieIndex].imageCover = image
            
        }
    }
    
    func getImagesPopular(url: String) {
        MovieService.getImage(urlString: url) { image, urlString in
            
            guard let movieIndex = self.popular.firstIndex(where: { $0.poster_path == urlString }) else { return }
            self.popular[movieIndex].imageCover = image
            
        }
    }
}

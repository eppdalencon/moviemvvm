//
//  Movie.swift
//  TableViewGA
//
//  Created by Marina De Pazzi on 25/05/23.
//

import Foundation
import UIKit

struct MovieResponse: Decodable {
    var results: [Movie]
}

struct Movie: Decodable {
    var id: Int
    var title: String
    var overview: String
    var vote_average: Double
    var poster_path: String
    var imageCover: Data?
}

enum Section: Int, CaseIterable {
    case nowPlaying
    case popular
    
    var value: String {
        switch self {
            case .nowPlaying:
                return "Now Playing"
            case .popular:
                return "Popular"
        }
    }
}




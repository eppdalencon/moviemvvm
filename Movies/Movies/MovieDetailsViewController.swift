//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Lucas Cunha on 22/03/24.
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    override func viewDidLoad() {
        setup()
    }
}

private extension MovieDetailsViewController {
    
    private func setup() {
        
         let scrollView = UIScrollView()
         let movieDetail = MovieDetailsView()
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.isScrollEnabled = true
         scrollView.backgroundColor = .cyan
         movieDetail.translatesAutoresizingMaskIntoConstraints = false
        
         self.view.addSubview(scrollView)
         scrollView.addSubview(movieDetail)
        
         NSLayoutConstraint.activate([
             movieDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
             movieDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
             movieDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
             movieDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
         ])
        
         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
         ])
        
    }
}

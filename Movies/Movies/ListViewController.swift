//
//  ListViewController.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit



class ListViewController: UIViewController {
    
    private var movies : [Movie] = [
        Movie(id: 1, title: "Inception", overview: "A thief who enters the dreams of others to steal secrets from their subconscious.", vote_average: 8.8, poster_path: "inception_poster.jpg", imageCover: nil),
        Movie(id: 2, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", vote_average: 9.3, poster_path: "shawshank_redemption_poster.jpg", imageCover: nil),
        Movie(id: 3, title: "The Dark Knight", overview: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", vote_average: 9.0, poster_path: "dark_knight_poster.jpg", imageCover: nil),
        Movie(id: 4, title: "Interstellar", overview: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", vote_average: 8.6, poster_path: "interstellar_poster.jpg", imageCover: nil),
        Movie(id: 5, title: "Pulp Fiction", overview: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", vote_average: 8.9, poster_path: "pulp_fiction_poster.jpg", imageCover: nil)
    ]

    
    private lazy var cv: UICollectionView = {
        
        print("criando")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        let vw = UICollectionView(frame: .zero, collectionViewLayout: layout)
        vw.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: "MovieCollectionViewCell")
        vw.dataSource = self
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
    }

}

extension ListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("caiu")
        let item = self.movies[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
     
        cell.item = item
        
        return cell
    }
    
    
}


private extension ListViewController {
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "MovieDB"
        self.view.backgroundColor = .white
        
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
            cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        ])
        
    }
    
}

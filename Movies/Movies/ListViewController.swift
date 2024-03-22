//
//  ListViewController.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit
import SafariServices


class ListViewController: UIViewController {
    
    private let vm = MovieViewModel()
    private var search = UISearchController(searchResultsController: nil)
    
    private var movies : [Movie] = [
        Movie(id: 1, title: "Inception", overview: "A thief who enters the dreams of others to steal secrets from their subconscious.", vote_average: 8.8, poster_path: "inception_poster.jpg", imageCover: nil),
        Movie(id: 2, title: "The Shawshank Redemption", overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", vote_average: 9.3, poster_path: "shawshank_redemption_poster.jpg", imageCover: nil),
        Movie(id: 3, title: "The Dark Knight", overview: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", vote_average: 9.0, poster_path: "dark_knight_poster.jpg", imageCover: nil),
        Movie(id: 4, title: "Interstellar", overview: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", vote_average: 8.6, poster_path: "interstellar_poster.jpg", imageCover: nil),
        Movie(id: 5, title: "Pulp Fiction", overview: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", vote_average: 8.9, poster_path: "pulp_fiction_poster.jpg", imageCover: nil)
    ]

    
    private lazy var cv: UITableView = {
        
      
       
        
        let vw = UITableView(frame: .zero, style: .plain)
        
   
        vw.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
//        vw.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        vw.delegate = self
        vw.dataSource = self
        vw.separatorStyle = .none
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.getMovies()
        vm.getMoviesPopular()
        setup()
       
    }

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        self.vm.nowPlaying.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = self.vm.sections[section]
        
        switch currentSection {
            case .nowPlaying:
            return self.vm.nowPlaying.count
            case .popular:
                return self.vm.popular.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.vm.sections[section].value
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        var content = header.defaultContentConfiguration()
        
        content.text = self.vm.sections[section].value
   
        content.textProperties.font = .preferredFont(forTextStyle: .headline).withSize(22)
        content.textProperties.color = .black
        
        header.contentConfiguration = content
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = self.vm.sections[indexPath.section]
        
        
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        
        switch currentSection {
            
        case .nowPlaying:
            
            let item = self.vm.nowPlaying[indexPath.item]
            cell.item = item
            cell.delegate = self
            
            if let imagedata = item.imageCover{
    
                cell.vw!.imageView.image = UIImage(data: imagedata)
            } else {
                vm.getImages(url: item.poster_path){
                    DispatchQueue.main.async {
                        self.cv.reloadData()
                    }
                }
                
            
            }
            
            return cell
            
            
        case .popular:
            
            let item = self.vm.popular[indexPath.item]
            cell.item = item
            cell.delegate = self
            
            if let imagedata = item.imageCover{
                cell.vw!.imageView.image = UIImage(data: imagedata)
            } else {
                vm.getImagesPopular(url: item.poster_path){
                    DispatchQueue.main.async {
                        self.cv.reloadData()
                    }
                }
                
            
            }
            
            return cell
        }
        
     
      
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.vm.sections.count
    }
    
    
    
    
}

extension ListViewController: MovieViewModelDelegate{
    func didFinish() {
        
        DispatchQueue.main.async{
            self.cv.reloadData()
        }
     
    }
    
    func didFail(error: Error) {
        print(error)
    }
    
    
}


private extension ListViewController {
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Movies"
        self.navigationItem.searchController = search
       
        
       
               
        self.view.backgroundColor = .white
        
        let translux = UINavigationBarAppearance()
        translux.backgroundColor = .red
       
        
        self.view.addSubview(cv)
        
        NSLayoutConstraint.activate([
            cv.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            cv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            cv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
    }
    
}

extension ListViewController : MovieTableViewCellDelegate {
    func didNavigate() {
        let url = URL(string: "https://google.com")!
        let vc = SFSafariViewController(url: url)
        
        self.present(vc, animated:true)
    }
    
    
}

//extension ListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width, height: 50)
//    }
//}

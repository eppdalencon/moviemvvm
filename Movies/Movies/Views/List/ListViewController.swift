//
//  ListViewController.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit

class ListViewController: UIViewController {
    
    private let vm = MovieViewModel()
    private var search = UISearchController(searchResultsController: nil)
    
    private lazy var cv: UITableView = {
 
    let vw = UITableView(frame: .zero, style: .plain)

    vw.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
    vw.delegate = self
    vw.dataSource = self
    vw.separatorStyle = .none
    vw.translatesAutoresizingMaskIntoConstraints = false
    return vw
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        vm.delegate = self
        vm.getMoviesPopular()
        vm.getMovies()
        setup()
    }

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = self.vm.sections[section]
        
        switch currentSection {
            case .popular:
                return self.vm.popular.count
            case .nowPlaying:
            return self.vm.nowPlaying.count
            
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
    func didNavigate(movie: Movie) {
        let viewDetails = MovieDetailsViewController(movie: movie)
        self.navigationController?.pushViewController(viewDetails, animated: true)
        
    }
    
    
}


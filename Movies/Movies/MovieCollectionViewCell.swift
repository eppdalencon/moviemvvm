//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    func didNavigate(movie: Movie)
}

class MovieTableViewCell: UITableViewCell {
    
   var vw: MovieView?
    
    weak var delegate: MovieTableViewCellDelegate?
    
    var item : Movie? {
        didSet{
            
            vw?.set(title: item?.title ?? "title", description: item?.overview ?? "overview", rating: String(format: "%.1f",item?.vote_average ?? 0) )
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

private extension MovieTableViewCell {
    func setup(){
        
        guard vw == nil else {return}
        
        vw = MovieView{
            self.delegate?.didNavigate(movie:self.item!)
        }
        
        self.contentView.addSubview((vw!))
        
        NSLayoutConstraint.activate([
            vw!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            vw!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
            vw!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            vw!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
    }
}


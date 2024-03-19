//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private var vw: MovieView?
    
    var item : Movie? {
        didSet{
            print("setou")
            vw?.set(title: item?.title ?? "title", description: item?.overview ?? "overview", rating: String(item?.vote_average ?? 0) ?? "78")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

private extension MovieCollectionViewCell {
    func setup(){
        
        guard vw == nil else {return}
        
        vw = MovieView()
        
        self.contentView.addSubview((vw!))
        
        NSLayoutConstraint.activate([
            vw!.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            vw!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            vw!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            vw!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
    }
}

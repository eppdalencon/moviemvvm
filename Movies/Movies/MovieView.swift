//
//  MovieView.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import Foundation

import UIKit

class MovieView: UIView {
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Velozes e Furiosos"
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    private lazy var descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Está entre os filmes já feitos"
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.setContentCompressionResistancePriority(.required, for: .vertical)
        return lbl
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dom")
        imageView.contentMode = .scaleAspectFit // ou .scaleAspectFill, dependendo da necessidade
        imageView.backgroundColor = UIColor.blue
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()
    
    private lazy var ratingLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "7.7"
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    
    
    private lazy var infoStackVw: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()
    
    private lazy var movieStackVw: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.spacing = 8
        return vw
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (title: String, description: String, rating: String){
        titleLbl.text = title
        descriptionLbl.text = description
        ratingLbl.text = rating
    }
    
    
}


private extension MovieView {
    private func setup() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(movieStackVw)
        
        NSLayoutConstraint.activate([
            movieStackVw.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            movieStackVw.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            movieStackVw.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieStackVw.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
        
        movieStackVw.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: movieStackVw.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: movieStackVw.topAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: movieStackVw.bottomAnchor, constant: -8),
            imageView.leadingAnchor.constraint(equalTo: movieStackVw.leadingAnchor, constant: 8)
        ])
        
        
        movieStackVw.addArrangedSubview(infoStackVw)
        
        infoStackVw.addArrangedSubview(titleLbl)
        infoStackVw.addArrangedSubview(descriptionLbl)
        infoStackVw.addArrangedSubview(ratingLbl)
        
//        descriptionLbl.setContentCompressionResistancePriority(.required, for: .vertical) // Ensure label expands vertically
        
        NSLayoutConstraint.activate([
            infoStackVw.topAnchor.constraint(equalTo: movieStackVw.topAnchor, constant: 8),
            infoStackVw.bottomAnchor.constraint(equalTo: movieStackVw.bottomAnchor, constant: -8),
            infoStackVw.trailingAnchor.constraint(equalTo: movieStackVw.trailingAnchor, constant: -8)
        ])
        
        
    }
    

}

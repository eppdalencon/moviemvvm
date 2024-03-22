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
        lbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return lbl
    }()
    
    private lazy var descriptionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Está entre os filmes já feitos"
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.setContentCompressionResistancePriority(.required, for: .vertical)
        lbl.numberOfLines = 6
        lbl.heightAnchor.constraint(equalToConstant: 70).isActive = true
        lbl.textColor = UIColor.secondaryLabel
        return lbl
    }()
    
     lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "dom2")
        imageView.contentMode = .scaleAspectFit // ou .scaleAspectFill, dependendo da necessidade
//        imageView.backgroundColor = UIColor.blue
        imageView.widthAnchor.constraint(equalToConstant: 92).isActive = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var rateStack: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
       
        return vw
    }()
    
    private lazy var star: UIImageView = {
        let star = UIImageView()
        star.translatesAutoresizingMaskIntoConstraints = false
        star.image = UIImage(systemName: "star")
        star.contentMode = .scaleAspectFit // ou .scaleAspectFill, dependendo da necessidade
        star.tintColor = UIColor.secondaryLabel
    
        star.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        star.layer.masksToBounds = true
        return star
    }()
    
    private lazy var ratingLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "7.7"
        
     
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        lbl.heightAnchor.constraint(equalToConstant: 16).isActive = true
        lbl.textColor = UIColor.secondaryLabel
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
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
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
//        self.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(movieStackVw)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(movieViewTapped))
         self.isUserInteractionEnabled = true
         self.addGestureRecognizer(tapGestureRecognizer)
        
        NSLayoutConstraint.activate([
            movieStackVw.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            movieStackVw.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            movieStackVw.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            movieStackVw.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
        
        movieStackVw.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: movieStackVw.centerYAnchor),
            imageView.topAnchor.constraint(equalTo: movieStackVw.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: movieStackVw.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: movieStackVw.leadingAnchor, constant: 8)
        ])
        
        
        movieStackVw.addArrangedSubview(infoStackVw)
        
        infoStackVw.addArrangedSubview(titleLbl)
        infoStackVw.addArrangedSubview(descriptionLbl)
        infoStackVw.addArrangedSubview(rateStack)
        
//        descriptionLbl.setContentCompressionResistancePriority(.required, for: .vertical) // Ensure label expands vertically
        
        NSLayoutConstraint.activate([
            infoStackVw.topAnchor.constraint(equalTo: movieStackVw.topAnchor, constant: 8),
            infoStackVw.bottomAnchor.constraint(equalTo: movieStackVw.bottomAnchor, constant: -8),
            infoStackVw.trailingAnchor.constraint(equalTo: movieStackVw.trailingAnchor, constant: -8)
        ])
        
        rateStack.addArrangedSubview(star)
        rateStack.addArrangedSubview(ratingLbl)
        
        NSLayoutConstraint.activate([
            star.topAnchor.constraint(equalTo: rateStack.topAnchor),
            star.bottomAnchor.constraint(equalTo: rateStack.bottomAnchor),
            star.leadingAnchor.constraint(equalTo: rateStack.leadingAnchor),
            star.trailingAnchor.constraint(equalTo: ratingLbl.leadingAnchor, constant: -2),
        ])
        
        NSLayoutConstraint.activate([
            ratingLbl.topAnchor.constraint(equalTo: rateStack.topAnchor),
            ratingLbl.bottomAnchor.constraint(equalTo: rateStack.bottomAnchor),
            ratingLbl.trailingAnchor.constraint(equalTo: rateStack.trailingAnchor),
        ])
        
    }
    
    @objc private func movieViewTapped() {
           // Call the action provided to MovieView initializer
       
           action()
       }
    

}

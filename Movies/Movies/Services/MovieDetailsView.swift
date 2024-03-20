//
//  MovieDetails.swift
//  Movies
//
//  Created by Lucas Cunha on 19/03/24.
//

import UIKit

class MovieDetailsView: UIView {
    
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var overview: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Steak"
        return lbl
    }()
    
    private lazy var overviewLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Overview"
        return lbl
    }()
    
    private lazy var imageCover: UILabel = { //vira um image
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "aaaaaaaaaa"
        return lbl
    }()
    
    private lazy var title: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "bbbbbbbb"
        return lbl
    }()
    
    private lazy var genres: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "algo,outra coisa"
        return lbl
    }()
    
    private lazy var vote_average: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "rating"
        return lbl
    }()

    private lazy var stackViewVertical: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.backgroundColor = .cyan
        vw.spacing = 8
        vw.alignment = .fill
        vw.distribution = .fillEqually
        return vw
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.alignment = .fill
        vw.distribution = .fillEqually
        vw.backgroundColor = .red
        vw.spacing = 8
        return vw
    }()
    
    private lazy var stackViewVerticalInner: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.backgroundColor = .green
        vw.spacing = 8
        vw.alignment = .fill
        vw.distribution = .fillEqually
        return vw
    }()
    
    
}

private extension MovieDetailsView{
    
    func setup(){
        print("cheguei aqui")
        
        stackViewVerticalInner.addArrangedSubview(title)
        stackViewVerticalInner.addArrangedSubview(genres)
        stackViewVerticalInner.addArrangedSubview(vote_average)

        stackViewHorizontal.addArrangedSubview(imageCover)
        stackViewHorizontal.addArrangedSubview(stackViewVerticalInner)
        

        stackViewVertical.addArrangedSubview(stackViewHorizontal)
        stackViewVertical.addArrangedSubview(overviewLabel)
        stackViewVertical.addArrangedSubview(overview)
        
        self.addSubview(stackViewVertical)
        
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            stackViewVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15),
            stackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            stackViewVertical.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80),
//            stackViewHorizontal.topAnchor.constraint(equalTo: stackViewVertical.topAnchor),
//            stackViewHorizontal.bottomAnchor.constraint(equalTo: stackViewVertical.bottomAnchor),
//            stackViewHorizontal.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor),
//            stackViewHorizontal.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor)
            ])
    }
    
}

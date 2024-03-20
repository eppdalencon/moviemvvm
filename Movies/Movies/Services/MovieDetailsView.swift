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
        lbl.text = "BLABLABLA"
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
        lbl.text = "imagem"
        return lbl
    }()
    
    private lazy var title: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rei leao"
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
        lbl.text = "7.1"
        
        return lbl
    }()
    
    private var star: UIImageView{
        let image = UIImageView(image: UIImage(systemName: "star")!)
        image.tintColor = .yellow
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 1).isActive = true
        image.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return image
    }

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
    
    private lazy var stackViewHorizontalInner: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.alignment = .fill
        vw.distribution = .fillEqually
        vw.backgroundColor = .purple
        vw.spacing = 8
        return vw
    }()
    
}

private extension MovieDetailsView{
    
    func setup(){
        print("cheguei aqui")
        
        stackViewHorizontalInner.addArrangedSubview(star)
        stackViewHorizontalInner.addArrangedSubview(vote_average)
        
        stackViewVerticalInner.addArrangedSubview(title)
        stackViewVerticalInner.addArrangedSubview(genres)
        stackViewVerticalInner.addArrangedSubview(stackViewHorizontalInner)

        stackViewHorizontal.addArrangedSubview(imageCover)
        stackViewHorizontal.addArrangedSubview(stackViewVerticalInner)
        

        stackViewVertical.addArrangedSubview(stackViewHorizontal)
        stackViewVertical.addArrangedSubview(overviewLabel)
        stackViewVertical.addArrangedSubview(overview)
        
        self.addSubview(stackViewVertical)
        
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            stackViewVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewVertical.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor),
            overviewLabel.topAnchor.constraint(equalTo: stackViewHorizontal.bottomAnchor)
            ])
    }
    
}

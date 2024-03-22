//
//  MovieDetails.swift
//  Movies
//
//  Created by Lucas Cunha on 19/03/24.
//
import UIKit

class MovieDetailsView: UIView {
    
    private var vm = MovieDetailsViewModel()
    
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
        lbl.text = "BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA"
        //lbl.backgroundColor = .orange
        lbl.lineBreakStrategy = .pushOut
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.defaultLow, for: .vertical)
        return lbl
    }()
    
    private lazy var overviewLabel: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = String("Overview")
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        //lbl.backgroundColor = .brown
        
        return lbl
    }()
    
    private lazy var overviewAux: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = String("aux")
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 1)
        //lbl.backgroundColor = .white
        lbl.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    
    private lazy var imageCover: UILabel = { //vira um image
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "imagem"
        //lbl.backgroundColor = .red
        return lbl
    }()
    
    private lazy var title: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Rei leao"
        lbl.font = .systemFont(ofSize: 22, weight: .bold)
        return lbl
    }()
    
    private lazy var genres: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "algo,outra coisa coisa coisacoisacoisacoisacoisacoisacoisa"
        lbl.numberOfLines = 2
        return lbl
    }()
    
    private lazy var vote_average: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "7.1"
        //lbl.backgroundColor = .white
        
        return lbl
    }()
    
    private var star: UIImageView{
        let image = UIImageView(image: UIImage(systemName: "star")!)
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        //image.backgroundColor = .white
        image.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        image.widthAnchor.constraint(equalToConstant: 3).isActive = true
//        image.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return image
    }

    private lazy var stackViewVertical: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        //vw.backgroundColor = .black
        vw.spacing = 8
        vw.alignment = .fill
        vw.distribution = .fillProportionally
        return vw
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.alignment = .fill
        vw.distribution = .fill
        //vw.backgroundColor = .blue
        vw.spacing = 8
        return vw
    }()
    
    private lazy var stackViewVerticalInner: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        //vw.backgroundColor = .green
        vw.spacing = 8
        vw.alignment = .fill
        vw.distribution = .fill
        return vw
    }()
    
    private lazy var stackViewHorizontalInner: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.alignment = .leading
        vw.distribution = .fill
        //vw.backgroundColor = .purple
        vw.spacing = 8
        
        return vw
    }()
    
}

private extension MovieDetailsView{
    
    func setup(){
        stackViewHorizontalInner.addArrangedSubview(star)
        stackViewHorizontalInner.addArrangedSubview(vote_average)
        
        stackViewVerticalInner.addArrangedSubview(title)
        stackViewVerticalInner.addArrangedSubview(genres)
        stackViewVerticalInner.addArrangedSubview(stackViewHorizontalInner)
        
        NSLayoutConstraint.activate([
            stackViewHorizontalInner.leadingAnchor.constraint(equalTo: stackViewVerticalInner.leadingAnchor),
            stackViewHorizontalInner.bottomAnchor.constraint(equalTo: stackViewVerticalInner.bottomAnchor),
            stackViewHorizontalInner.topAnchor.constraint(equalTo: genres.bottomAnchor),
        ])

        stackViewHorizontal.addArrangedSubview(imageCover)
        stackViewHorizontal.addArrangedSubview(stackViewVerticalInner)
        
        NSLayoutConstraint.activate([
            imageCover.leadingAnchor.constraint(equalTo: stackViewHorizontal.leadingAnchor),
            imageCover.topAnchor.constraint(equalTo: stackViewHorizontal.topAnchor),
            imageCover.bottomAnchor.constraint(equalTo: stackViewHorizontal.bottomAnchor),
            imageCover.trailingAnchor.constraint(equalTo: stackViewVerticalInner.leadingAnchor),
            imageCover.heightAnchor.constraint(equalToConstant: 194),
            imageCover.widthAnchor.constraint(equalToConstant: 128)
        ])
        
        NSLayoutConstraint.activate([
            stackViewVerticalInner.leadingAnchor.constraint(equalTo: imageCover.trailingAnchor),
            stackViewVerticalInner.topAnchor.constraint(equalTo: stackViewHorizontal.topAnchor, constant: 80),
            stackViewVerticalInner.bottomAnchor.constraint(equalTo: stackViewHorizontal.bottomAnchor),
            stackViewVerticalInner.trailingAnchor.constraint(equalTo: stackViewHorizontal.trailingAnchor),
        ])
        

        stackViewVertical.addArrangedSubview(stackViewHorizontal)
        stackViewVertical.addArrangedSubview(overviewLabel)
        stackViewVertical.addArrangedSubview(overview)
        stackViewVertical.addArrangedSubview(overviewAux)
        
        self.addSubview(stackViewVertical)
        
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            stackViewVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewVertical.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor),
            stackViewHorizontal.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor)
            //overview.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 10),
//            stackViewHorizontalInner.topAnchor.constraint(equalTo: stackViewHorizontalInner.topAnchor, constant:  16),
            
//            star.topAnchor.constraint(equalTo: topAnchor),
//            star.bottomAnchor.constraint(equalTo: bottomAnchor),
//            star.leadingAnchor.constraint(equalTo: leadingAnchor)
        
        ])
    }
}

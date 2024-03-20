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
    
    private lazy var nameLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Steak"
        return lbl
    }()
    
    private lazy var emailLbl: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Steak.com"
        return lbl
    }()
    
    private lazy var third: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "aaaaaaaaaa"
        return lbl
    }()
    
    private lazy var foo: UILabel = {
        
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "bbbbbbbb"
        return lbl
    }()
    

    private lazy var stackViewVertical: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.backgroundColor = .blue
        vw.spacing = 8
        return vw
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.alignment = .leading
        vw.backgroundColor = .red
        vw.distribution = .fillEqually
        vw.spacing = 8
        return vw
    }()
    
    
    
}

private extension MovieDetailsView{
    
    func setup(){
        
        print("cheguei aqui")
        
        self.addSubview(stackViewVertical)
        
        stackViewVertical.addArrangedSubview(emailLbl)
        stackViewVertical.addArrangedSubview(nameLbl)
        
        stackViewVertical.addSubview(stackViewHorizontal)
        
        stackViewHorizontal.addArrangedSubview(third)
        stackViewHorizontal.addArrangedSubview(foo)
        
        
        NSLayoutConstraint.activate([
            stackViewVertical.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            stackViewVertical.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15),
            stackViewVertical.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            stackViewVertical.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -80),
            stackViewHorizontal.topAnchor.constraint(equalTo: stackViewVertical.topAnchor),
            stackViewHorizontal.bottomAnchor.constraint(equalTo: stackViewVertical.bottomAnchor),
            stackViewHorizontal.trailingAnchor.constraint(equalTo: stackViewVertical.trailingAnchor, constant: 150),
            stackViewHorizontal.leadingAnchor.constraint(equalTo: stackViewVertical.leadingAnchor, constant: 150)
            ])
    }
    
}

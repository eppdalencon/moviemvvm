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

    private lazy var stackViewVertical: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .vertical
        vw.spacing = 8
        return vw
    }()
    
    private lazy var stackViewHorizontal: UIStackView = {
        let vw = UIStackView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.axis = .horizontal
        vw.spacing = 8
        return vw
    }()
    
    
    
}

private extension MovieDetailsView{
    
    func setup(){
        
        print("cheguei aqui")
        
        stackViewHorizontal.addArrangedSubview(emailLbl)
        
        
        stackViewVertical.addArrangedSubview(emailLbl)
        stackViewVertical.addArrangedSubview(nameLbl)
        
        stackViewVertical.addSubview(stackViewHorizontal)
        
        self.addSubview(stackViewVertical)
        
        
        NSLayoutConstraint.activate([
            stackViewVertical.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackViewVertical.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackViewHorizontal.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackViewHorizontal.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
    }
    
}

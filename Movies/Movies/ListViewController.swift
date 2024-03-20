//
//  ListViewController.swift
//  Movies
//
//  Created by Eduardo Dalencon on 19/03/24.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
       
    }

}


private extension ListViewController {
    
    private func setup() {
        
        let vw = MovieDetailsView()
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(vw)
        
        NSLayoutConstraint.activate([
            vw.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            vw.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            vw.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            vw.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
        ])
        
        self.view.backgroundColor = .white
        
    }
    
}

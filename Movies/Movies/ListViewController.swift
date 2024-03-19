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
            vw.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vw.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        self.view.backgroundColor = .white
        
    }
    
}

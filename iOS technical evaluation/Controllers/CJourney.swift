//
//  CJourney.swift
//  iOS technical evaluation
//
//  Created by Ángel Téllez on 22.Nov.2020 .
//

import Foundation
import UIKit

class CJourney: UIViewController {
    var presenter: RowPresenter?
    override func viewDidLoad() {
       
        view = VJourney(data: [])
        presenter = RowPresenter.getPresenter(view: view as! VJourney)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        #if DEV
            title = "Daniel Journey"
        #else
            title = "Suggestic Journey"
        #endif
       
        loadData()
    }

}

//MARK: - Private methods

private extension CJourney {
    
    // Imagine this is an async call to the server.
    func loadData()  {
        presenter?.loadData()
    }
    
}


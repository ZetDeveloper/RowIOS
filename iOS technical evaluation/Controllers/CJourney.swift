//
//  CJourney.swift
//  iOS technical evaluation
//
//  Created by Ángel Téllez on 22.Nov.2020 .
//

import Foundation
import UIKit

class CJourney: UIViewController {
    
    override func viewDidLoad() {
        let data = loadData()
        view = VJourney(data: data)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "Suggestic Journey"
    }

}


//MARK: - Private methods

private extension CJourney {
    
    // Imagine this is an async call to the server.
    func loadData() -> [Int] {
        var data: [Int] = []
        for i in 0..<UInt8.max {
            data.append(Int(i))
        }
        return data
    }
    
}


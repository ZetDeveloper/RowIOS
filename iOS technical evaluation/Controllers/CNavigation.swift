//
//  CNavigation.swift
//  iOS technical evaluation
//
//  Created by Ángel Téllez on 22.Nov.2020 .
//

import UIKit

class CNavigation: UINavigationController {
    
    init() {
        super.init(rootViewController: CJourney())
        
        let navigationAppareance = UINavigationBarAppearance()
        navigationAppareance.configureWithOpaqueBackground()
        #if DEV
        navigationAppareance.backgroundImage = UIImage(named: "Gradient2")
        #else
        navigationAppareance.backgroundImage = UIImage(named: "Gradient")
        #endif
      
        
        navigationAppareance.largeTitleTextAttributes = [
            .foregroundColor : UIColor.white,
            .kern : 0.34
        ]
        
        navigationAppareance.titleTextAttributes = [
            .foregroundColor : UIColor.white,
            .kern : 0.34
        ]
        
        navigationBar.standardAppearance = navigationAppareance
        navigationBar.scrollEdgeAppearance = navigationAppareance
        navigationBar.prefersLargeTitles = true
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  RowContainer.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//
import UIKit
import SwiftUI
import Combine

class RowContainer<Content: View>: UICollectionViewDynamicHeightCell {
    
    @Published var model: RowModelElement?
    
    public var customView: UIHostingController<Content>?
    
    func host(_ view: Content) {
        
        
        let controller = UIHostingController(rootView: view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        self.customView = controller

        contentView.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            controller.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            controller.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            controller.view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        
        controller.view.layoutIfNeeded()
        
    }
    
}

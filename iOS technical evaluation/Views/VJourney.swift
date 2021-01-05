//
//  VJourney.swift
//  iOS technical evaluation
//
//  Created by Ángel Téllez on 22.Nov.2020 .
//

import UIKit
import SwiftUI

class VJourney: UIView {
    
    private var data: RowModel
    private var collection: UICollectionView?
    
    init(data: RowModel) {
        self.data = data
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        let flow = UICollectionViewFlowLayoutForDynamicHeightCells()
        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection = UICollectionView(frame: bounds, collectionViewLayout: flow)
        collection?.alwaysBounceVertical = true
        collection?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collection?.backgroundColor = .clear
        collection?.clipsToBounds = true
        collection?.dataSource = self
        collection?.showsHorizontalScrollIndicator = false
        collection?.register(RowContainer<AnyView>.self, forCellWithReuseIdentifier: "RowContainer")
        
        addSubview(collection!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension VJourney {
    func fill(data: RowModel) {
        self.data = data
        self.collection?.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension VJourney: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RowContainer", for: indexPath) as! RowContainer<AnyView>
        cell.host(AnyView(RowUIView(model: data[indexPath.row])))
        return cell
    }
    
}

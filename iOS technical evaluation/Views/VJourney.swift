//
//  VJourney.swift
//  iOS technical evaluation
//
//  Created by Ángel Téllez on 22.Nov.2020 .
//

import UIKit

class VJourney: UIView {
    
    private let data: [Int]
    
    init(data: [Int]) {
        self.data = data
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        let flow = UICollectionViewFlowLayoutForDynamicHeightCells()
        flow.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collection = UICollectionView(frame: bounds, collectionViewLayout: flow)
        collection.alwaysBounceVertical = true
        collection.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collection.backgroundColor = .clear
        collection.clipsToBounds = true
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(UICollectionViewEmptyCell.self, forCellWithReuseIdentifier: "UICollectionViewEmptyCell")
        
        addSubview(collection)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//MARK: - UICollectionViewDataSource

extension VJourney: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = data[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewEmptyCell", for: indexPath)
        cell.backgroundColor = UIColor.init(white: CGFloat(item)/256, alpha: 1)
        return cell
    }
    
}

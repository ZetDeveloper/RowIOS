//
//  DynamicCollectionView.swift
//  Suggestic
//
//  Created by Ángel Téllez on 12/12/19.
//  Copyright © 2019 Suggestic. All rights reserved.
//

import UIKit

/*
 Steps to use a dynamic height collection view:
 
 1. Create an instance of `UICollectionViewFlowLayoutForDynamicHeightCells` and set its `estimatedItemSize` property to `UICollectionViewFlowLayout.automaticSize`.
 2. Make sure that all the registered cells inherit from `UICollectionViewDynamicHeightCell`.
 3. If a cell has collections inside or views without an intrinsic content size, the `extraLayoutAttributesSize` could be overriden to adjust the height of the cell taking into consideration those views height.
 
 Note 1. When a collection has a layout of this kind it is **not** necessary to implement the method `collectionView(_:layout:sizeForItemAt:)` of the `UICollectionViewDelegateFlowLayout`.
 Note 2*. This dynamic height layout configuration needs that the vertical constraints of the cell to be satisfied. It means, their top and bottom anchor needs to be specified and determined.
 Note 3. Adequately, its subviews must to be added in its `contentView`.
 
 
 
 * **Known issues**
 
    - Height of internal collection views resize to 50.0 even when all constraints are satisfied ( https://forums.developer.apple.com/thread/105523 ). Afourtunately constraints are correctly updated after scrolling. Try to set the height of the cell less than 100pts to "fix" the issue.
 
    - If a cell only has a view constrained to the bounds of its `contentView` and this view does have an initial (intrinsic/content)size of `.zero`, an "Invalid parameter not satisfying: !CGSizeEqualToSize(size, CGSizeZero)" exception will be thrown. To avoid this exception is necessary to add a constraint to this view's height greater than or equal to 1. This will fix the former assertion failure but will draw the cell with an extra 1px height; so we need to override the `extraLayoutAttributesSize` and subtract 1px from the height.
 
 
 * **ADVICE**
 
    Its recommended to use this approach only if you are working with a single `UICollectionView` (with no other nested collections). If you have multiple levels of collections, one inside another; better you should consider an intermediate approach where the internal collections are dynamic but the outer is "hardcoded" implementing the method `collectionView(_:, layout:, sizeForItemAt:) -> CGSize`.
*/


//MARK: - UICollectionViewDynamicHeightCell

/// Subclass of a single collection view data item which autoresize itself dynamically.
///
/// This subclass overrides properties and methods necessary to autoresize itself vertically.
class UICollectionViewDynamicHeightCell: UICollectionViewCell {
    
    /// Returns the total size of the receiver`s subviews which do not have an intrinsic content size.
    ///
    /// Override this property when this class has a collection view inside, or any other subview without an intrinsic content size. You must return the total size of those subviews, that means, you must add their height (for a vertical layout) or their width (for an horizontal layout).
    ///
    /// At the moment when the layout asks for a fitting size of the cell content in the `preferredLayoutAttributesFitting(:)` method, the size of those subviews without an intrinsic content size is _ignored_. Therefore, the value of this property is added to the final size calculations to countervail it.
    var extraLayoutAttributesSize: CGSize {
        return .zero
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        layoutIfNeeded()
        
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        var fittingSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        fittingSize.height += extraLayoutAttributesSize.height
        
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.frame.size = fittingSize
        
        return layoutAttributes
    }
    
}


//MARK: - UICollectionViewEmptyCell

/// Subclass of a single collection view data item which its height is 10pts.
///
/// The purpose of this subclass is to draw and empty cell when the data of the collection view is corrupted or does not exist. This subclass is specially used when the layout of the collection view is a `UICollectionViewFlowLayoutForDynamicHeightCells` instance.
class UICollectionViewEmptyCell: UICollectionViewCell {
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let layoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutAttributes.frame.size.height = 1
        return layoutAttributes
    }
    
}


//MARK: - UICollectionViewFlowLayoutForDynamicHeightCells

/// A concrete layout object that organizes items into a list with optional header and footer views for each section.
///
/// This subclass overrides the neccesary properties and methods to adjust each item to the width of the collection, including the former horizontal section insets. The height of each item is determined by the items themselves (commonly overriding the `preferredLayoutAttributesFitting(_)` method of `UICollectionReusableView`).
///
/// The `estimatedItemSize` property of this subclass **must** be set to `UICollectionViewFlowLayout.automaticSize`, or any other value except `CGSize.zero`, to avoid a infinite computing cycle.
class UICollectionViewFlowLayoutForDynamicHeightCells: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributesObjects = super.layoutAttributesForElements(in: rect)
        
        layoutAttributesObjects?.forEach({
            if let itemLayoutAttribute = layoutAttributesForItem(at: $0.indexPath), $0.representedElementCategory == .cell {
                $0.frame = itemLayoutAttribute.frame
            }
        })
        
        return layoutAttributesObjects
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let collectionView = collectionView,
            collectionView.numberOfItems(inSection: indexPath.section) > indexPath.item,
            let layoutAttributes = super.layoutAttributesForItem(at: indexPath) else {
                return nil
        }
        
        layoutAttributes.frame.origin.x = collectionView.safeAreaLayoutGuide.layoutFrame.minX + sectionInset.left
        layoutAttributes.frame.size.width = collectionView.safeAreaLayoutGuide.layoutFrame.width - sectionInset.left - sectionInset.right
        
        return layoutAttributes
    }
    
}

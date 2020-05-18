//
//  HorizontalSnappingViewController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/18/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit


class HorizontalSnappingViewController: UICollectionViewController
{
    init() {
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

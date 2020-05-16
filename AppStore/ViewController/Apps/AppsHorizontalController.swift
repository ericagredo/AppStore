//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/15/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppsHorizontalController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout
{
    let cellId = "horzCell"
    let topBottom : CGFloat = 12
    let lineSpacing: CGFloat = 10
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.register(AppCellForGroups.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottom - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottom, left: 16, bottom: topBottom, right: 16)
    }
    
}

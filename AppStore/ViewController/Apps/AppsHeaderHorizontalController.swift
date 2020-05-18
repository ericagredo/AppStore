//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/17/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppsHeaderHorizontalController: HorizontalSnappingViewController, UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"
    var socialAppGroup = [SocialApp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let socialApp = self.socialAppGroup[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        cell.companyLabel.text = socialApp.name
        cell.titleLabel.text = socialApp.tagline
        cell.imageView.sd_setImage(with: URL(string: socialApp.imageUrl))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialAppGroup.count
    }
    
 
    
    
}

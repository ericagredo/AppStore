//
//  AppsControler.swift
//  AppStore
//
//  Created by Eric Agredo on 5/15/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppsBaseCollectionViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout
{
    let cellId = "cellId"
    let headerId = "headerId"
    var appGroup: AppGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchData()
        
    }
    
    private func fetchData()
    {
        Network.shared.fetchGames { (group, err) in
            self.appGroup = group
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        cell.appSectionLabel.text = self.appGroup?.feed.title
        cell.horzController.appGroup = self.appGroup
        cell.horzController.collectionView.reloadData()
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }
    
}

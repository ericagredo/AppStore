//
//  AppSearchController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/13/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit
import SDWebImage

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    
    private let cellID = "cellID"
    private var appResultArr = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        self.retriveApps()
    
    }
    
    init()
    {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    private func retriveApps()
    {
        Network.shared.fetchItunesApps { (result, err) in
            self.appResultArr = result
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.appResultArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        
        
        let appResult = self.appResultArr[indexPath.item]
        cell.appResult = appResult
        
      
        return cell
    }
}

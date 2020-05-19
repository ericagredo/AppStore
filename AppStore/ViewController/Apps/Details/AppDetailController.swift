//
//  AppDetailController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/18/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit


class AppDetailController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var appId: String! {
        didSet {
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            Network.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                self.app = result?.results.first
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
                       Network.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews?, err) in
                           if let err = err {
                               print("Failed to decode reviews:", err)
                               return
                           }
                           self.reviews = reviews
                           DispatchQueue.main.async {
                               self.collectionView.reloadData()
                           }
            }
        }
    }
    var reviews: Reviews?
    var app: Result?
    
    let detailCellId = "detailCellId"
    let previewCellId = "previewCellId"
    let reviewCellId = "reviewCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewScreenshotCell.self, forCellWithReuseIdentifier: previewCellId)
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: reviewCellId)
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = self.app
            return cell
        }
        else if indexPath.item == 1{
            let previewCell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewScreenshotCell
            previewCell.horizontalController.app = self.app
            return previewCell
        }
        
        else
        {
            let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewCell
            reviewCell.controller.reviews = self.reviews
            return reviewCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellHeight : CGFloat = 280
        if indexPath.item == 0
        {
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = self.app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            cellHeight = estimatedSize.height
            
        }
        else if indexPath.item == 1
        {
            cellHeight = 500
        }
        
        else
        {
            
        }
        
        return .init(width: view.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
}

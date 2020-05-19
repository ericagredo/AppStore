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
    let cellId            = "cellId"
    let headerId          = "headerId"
    var groups            = [AppGroup]()
    var socialApp         = [SocialApp]()
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        fetchData()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.color = .black
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.fillSuperview()
        
        
    }
    
    private func fetchData()
    {
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        // help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Network.shared.fetchGroup(group: "new-games-we-love") { (appGroup, err) in
            print("games welov")
            dispatchGroup.leave()
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Network.shared.fetchGroup(group: "top-grossing") { (appGroup, err) in
           print("top grossing")
            dispatchGroup.leave()
            group2 = appGroup
        }
        
        dispatchGroup.enter()
        Network.shared.fetchSocialApps { (socialApp, err) in
            dispatchGroup.leave()
            self.socialApp = socialApp ?? []
        }
        
        dispatchGroup.enter()
        Network.shared.fetchGroup(group: "top-free") { (appGroup, err) in
            print("top free")
            dispatchGroup.leave()
        
            group3 = appGroup
        }
        
        
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("completed your dispatch group tasks...")
            self.activityIndicator.stopAnimating()
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        let appGroup = groups[indexPath.item]
        cell.appSectionLabel.text = appGroup.feed.title
        cell.horzController.appGroup = appGroup
        cell.horzController.collectionView.reloadData()
        
        cell.horzController.didSelectHandler = { [weak self] feedResult in
            
            let controller = AppDetailController()
            controller.appId = feedResult.id
            controller.navigationItem.title = feedResult.name
            self?.navigationController?.pushViewController(controller, animated: true)
        }
        
       
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socialAppGroup = self.socialApp
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
}

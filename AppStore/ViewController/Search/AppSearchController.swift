//
//  AppSearchController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/13/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit


class AppSearchController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout
{
    
    private let cellID = "cellID"
    private var appResultArr = [Result]()
    private var searchBarController = UISearchController()
    private var timer: Timer?
    private let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please Enter Search Term Above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        self.setupSearchBar()
        collectionView.addSubview(enterSearchTermLabel)
//        enterSearchTermLabel.translatesAutoresizingMaskIntoConstraints = false
//        enterSearchTermLabel.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
//        enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        enterSearchTermLabel.centerXInSuperview()
        enterSearchTermLabel.fillSuperview(padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
    
    }
    
    private func setupSearchBar()
    {
        definesPresentationContext = true
        navigationItem.searchController = self.searchBarController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.searchBarController.obscuresBackgroundDuringPresentation = false
        self.searchBarController.searchBar.delegate = self

    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appId = String(appResultArr[indexPath.item].trackId)
        let appDetailController = AppDetailController(appId: appId)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = self.appResultArr.count != 0
        return self.appResultArr.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell
        
        
        let appResult = self.appResultArr[indexPath.item]
        cell.appResult = appResult
        
      
        return cell
    }
}

extension AppSearchController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
             Network.shared.fetchItunesApps(searchText: searchText) { (result, err) in
                self.appResultArr = result?.results ?? []
                       DispatchQueue.main.async {
                           self.collectionView.reloadData()
                       }
                   }
        })
       
    }
}

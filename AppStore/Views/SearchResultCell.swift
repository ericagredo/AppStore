//
//  SearchResultCell.swift
//  AppStore
//
//  Created by Eric Agredo on 5/13/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    var appResult: Result! {
        didSet
        {
            
            var avgRating = appResult.averageUserRating ?? 0
            avgRating = (avgRating * 100).rounded() / 100
            appNameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            downloadLabel.text = "Rating: \(avgRating)"

            let artworkUrl = URL(string: appResult.artworkUrl100)
            iconImageView.sd_setImage(with: artworkUrl)
            
            screenShot1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1
            {
                screenShot2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2
            {
                screenShot3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
                   
        }
    }
    
    let iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 64.0).isActive = true
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()

        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let downloadLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .lightGray
        button.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        
        return button
        
    }()
    
    lazy var screenShot1 = self.createScrenShotImageView()
    lazy var screenShot2 = self.createScrenShotImageView()
    lazy var screenShot3 = self.createScrenShotImageView()
    
    
    func createScrenShotImageView() ->UIImageView
    {
        let imgView = UIImageView()
        imgView.layer.cornerRadius = 8
        imgView.clipsToBounds = true
        imgView.layer.borderWidth = 0.5
        imgView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imgView.contentMode = .scaleAspectFill
        return imgView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, VerticalStackView(arrangedSubviews: [appNameLabel,categoryLabel,downloadLabel]), getButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        let screenShotStackView = UIStackView(arrangedSubviews: [screenShot1,screenShot2,screenShot3])
        screenShotStackView.distribution = .fillEqually
        screenShotStackView.spacing = 12
        
        let overAllStack = VerticalStackView(arrangedSubviews: [stackView,screenShotStackView], spacing: 16.0)
        
        
        addSubview(overAllStack)
        overAllStack.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  AppsGroupCell.swift
//  AppStore
//
//  Created by Eric Agredo on 5/15/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell
{
    let appSectionLabel : UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        return label
    }()
    
    let horzController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appSectionLabel)
        appSectionLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horzController.view)
        horzController.view.anchor(top: appSectionLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

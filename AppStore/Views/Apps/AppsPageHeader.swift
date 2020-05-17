//
//  AppsPageHeader.swift
//  AppStore
//
//  Created by Eric Agredo on 5/16/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView
{
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

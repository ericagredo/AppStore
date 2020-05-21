//
//  TodayCell.swift
//  AppStore
//
//  Created by Eric Agredo on 5/20/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell
{
    lazy var imgView : UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "garden"))
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imgView)
        self.backgroundColor = .white
        layer.cornerRadius = 16
        imgView.contentMode = .scaleAspectFill
        imgView.centerInSuperview(size: .init(width: 250, height: 250))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  AppCellForGroups.swift
//  AppStore
//
//  Created by Eric Agredo on 5/15/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppCellForGroups: UICollectionViewCell
{
    let imgView : UIImageView =
    {
        let imgView = UIImageView()
        imgView.backgroundColor = .purple
        return imgView
    }()
    
    let appLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let getButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitle("GET", for: .normal)
        return button
    }()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        let stackView = UIStackView(arrangedSubviews: [imgView,appLabel,getButton])
        self.backgroundColor = .brown
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

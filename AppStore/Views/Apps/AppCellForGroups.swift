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
    let imgView = UIImageView(cornerRadius: 8)
    let appLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        imgView.backgroundColor = .purple
        imgView.constrainWidth(constant: 64)
        imgView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius = 16
       
        let stackView = UIStackView(arrangedSubviews: [imgView,VerticalStackView(arrangedSubviews: [appLabel,companyLabel], spacing: 4),getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ReviewCell.swift
//  AppStore
//
//  Created by Eric Agredo on 5/19/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell
{
    let controller = ReviewCollectionController()
    let reviewsRatingsLabel = UILabel(text: "Reviews & Ratings", font: .boldSystemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(controller.view)
        addSubview(reviewsRatingsLabel)
        addSubview(controller.view)
        reviewsRatingsLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        controller.view.anchor(top: reviewsRatingsLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

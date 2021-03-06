//
//  AppFullscreenHeaderCell.swift
//  AppStore
//
//  Created by Eric Agredo on 5/21/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppFullscreenHeaderCell: UITableViewCell
{
    let todayCell = TodayCell(frame: .zero, radius: 0)
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(todayCell)
        todayCell.fillSuperview()
        
        addSubview(closeButton)
        
        closeButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 48, left: 0, bottom: 0, right: 12), size: .init(width: 80, height: 38))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

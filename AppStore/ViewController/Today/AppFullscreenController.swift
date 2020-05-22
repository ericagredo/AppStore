//
//  AppFullscreenController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/20/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class AppFullscreenController: UITableViewController
{
    var dismissHandler: (() ->())?
       var todayItem: TodayItem?
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           tableView.tableFooterView = UIView()
           tableView.separatorStyle = .none
           tableView.allowsSelection = false
        tableView.contentInsetAdjustmentBehavior = .never
        let frame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        tableView.contentInset = .init(top: 0, left: 0, bottom: frame.height, right: 0)
       }
       
       override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 2
       }
       
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           if indexPath.item == 0 {
               let headerCell = AppFullscreenHeaderCell()
               headerCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
               headerCell.todayCell.todayItem = todayItem
               return headerCell
           }
           
           let cell = AppFullscreenDescriptionCell()
           return cell
       }
       
       @objc fileprivate func handleDismiss(button: UIButton) {
           button.isHidden = true
           dismissHandler?()
       }
       
       override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           if indexPath.row == 0 {
               return 494
           }
           return super.tableView(tableView, heightForRowAt: indexPath)
       }
}

//
//  ViewController.swift
//  TodayApp
//
//  Created by ilter on 24.09.2021.
//

import UIKit

final class ReminderListViewController: UITableViewController {
    
    private var reminderListDataSource: ReminderListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }

}

extension ReminderListViewController {

}





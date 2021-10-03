//
//  ViewController.swift
//  TodayApp
//
//  Created by ilter on 24.09.2021.
//

import UIKit

protocol ReminderDetailDelegate {
    func navigateToDetail(viewController: UITableViewController, indexPath: IndexPath)
}

final class ReminderListViewController: UITableViewController {
    
    private var reminderListDataSource: ReminderListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }

}

extension ReminderListViewController {
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "ReminderDetailViewController") as? ReminderDetailViewController else {
            return
        }
        
        viewController.reminder = Reminder.testData[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)

    }
}






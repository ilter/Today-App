//
//  ReminderListDataSource.swift
//  TodayApp
//
//  Created by ilter on 30.09.2021.
//

import UIKit

final class ReminderListDataSource: NSObject {
    
}

extension ReminderListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "ReminderListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Reminder.testData.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
               fatalError("Unable to dequeue ReminderCell")
        }
        let reminder = Reminder.testData[indexPath.row]

        cell.setupUI(title: reminder.title, dateText: reminder.dueDate.description, isDone: reminder.isComplete) {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "ReminderDetailViewController") as? ReminderDetailViewController else {
            return
        }
        
        viewController.reminder = Reminder.testData[indexPath.row]
        // self.navigationController?.pushViewController(viewController, animated: true)

    }
}

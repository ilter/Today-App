//
//  ReminderListDataSource.swift
//  TodayApp
//
//  Created by ilter on 30.09.2021.
//

import UIKit

final class ReminderListDataSource: NSObject {
    var delegate: ReminderDetailDelegate?
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

}

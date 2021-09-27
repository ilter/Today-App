//
//  ViewController.swift
//  TodayApp
//
//  Created by ilter on 24.09.2021.
//

import UIKit

class ReminderListViewController: UITableViewController {

}

extension ReminderListViewController {
    
    static let reminderListCellIdentifier = "ReminderListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return Reminder.testData.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
               fatalError("Unable to dequeue ReminderCell")
        }
        
        setupCellUI(cell: cell, indexPath: indexPath)
        
        cell.doneButtonAction = {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        
        return cell
    }
    
    func setupCellUI(cell: ReminderListCell, indexPath: IndexPath){
        let reminder = Reminder.testData[indexPath.row]
        let image = reminder.isComplete ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        cell.title.numberOfLines = 0
        cell.title.textAlignment = .natural
        cell.title.text = reminder.title
        cell.dateLabel.text = reminder.dueDate.description
        cell.doneButton.setBackgroundImage(image, for: .normal)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(identifier: "ReminderDetailViewController") as? ReminderDetailViewController else {
            return
        }
        
        viewController.reminder = Reminder.testData[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}





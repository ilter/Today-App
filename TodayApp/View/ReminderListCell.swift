//
//  ReminderListCell.swift
//  TodayApp
//
//  Created by ilter on 24.09.2021.
//

import Foundation
import UIKit

final class ReminderListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    private var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        doneButtonAction?()
    }
    
    func setupUI(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) {
        titleLabel.text = title
        dateLabel.text = dateText
        let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        doneButton.setBackgroundImage(image, for: .normal)
        self.doneButtonAction = doneButtonAction
    }
    
}

//
//  ReminderListCell.swift
//  TodayApp
//
//  Created by ilter on 24.09.2021.
//

import Foundation
import UIKit

class ReminderListCell: UITableViewCell {
    typealias DoneButtonAction = () -> Void
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        doneButtonAction?()
    }
    
}

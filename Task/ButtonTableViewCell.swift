//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Andrew Porter on 2/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet var taskTitleLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    var delegate: ButtonTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Actions
    @IBAction func buttonTapped(sender: UIButton) {
        if let delegate = delegate {
            delegate.buttonCellButtonTapped(self)
        }
    }
    
    //MARK: - Functions
    func updateButton(isComplete: Bool) {
        if isComplete {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    

}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        taskTitleLabel.text = task.title
        updateButton(task.isComplete)
    }
}
//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Andrew Porter on 2/14/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit



class ButtonTableViewCell: UITableViewCell {

    @IBOutlet var taskTitleLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    
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
        
    }
    
    //MARK: - Functions
    func updateButton(isComplete: Bool) {
        if isComplete {
            button.imageView?.image = UIImage(named: "complete")
        } else {
            button.imageView?.image = UIImage(named: "incomplete")
        }
    }
    

}

extension ButtonTableViewCell {
    
    func updateWithTask(task: Task) {
        taskTitleLabel.text = task.title
        updateButton(task.isComplete)
    }
}
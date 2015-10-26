//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Thang H Tong on 10/25/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate {
    func buttonTappedValueChanged(cell: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
  
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    var delegate: ButtonTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func buttonTapped(sender: UIButton) {
        delegate?.buttonTappedValueChanged(self)
    }
  
    func updateButton(isComplete: Bool) {
        if isComplete == true {
            button.imageView?.image = UIImage(named: "complete")
        } else {
            button.imageView?.image = UIImage(named: "incomplete")
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
extension ButtonTableViewCell {
    func updateWithTask(task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}
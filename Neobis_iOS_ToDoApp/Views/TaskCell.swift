//  TaskCell.swift
//  ToDoList_ios
//  Created by Askar Soronbekov
import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    var completed: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func completeSelected(_ sender: UIButton) {
        if !completed {
            completeButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            completeButton.currentImage?.withTintColor(.systemGreen)
            completed = true
        } else {
            completeButton.setImage(UIImage(systemName: "circle"), for: .normal)
            completeButton.currentImage?.withTintColor(.systemGreen)
            completed = false
        }
    }
}

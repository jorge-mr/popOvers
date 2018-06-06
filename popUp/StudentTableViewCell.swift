//
//  StudentTableViewCell.swift
//  popUp
//
//  Created by Jorge MR on 05/06/18.
//  Copyright © 2018 none. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var dotsButton: UIButton!
    @IBOutlet weak var flagImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  PersonCell.swift
//  ClassRosterB19
//
//  Created by Victor  Adu on 7/23/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet var cellImage: UIImageView?
    
    @IBOutlet var personName: UILabel?
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  DetailPhoneAddrCell.swift
//  FoodPin
//
//  Created by 朝凪汐 on 2021/1/6.
//

import UIKit

class DetailPhoneAddrCell: UITableViewCell {
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var shortText: UILabel! {
        didSet {
            shortText.numberOfLines = 0
    }
}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

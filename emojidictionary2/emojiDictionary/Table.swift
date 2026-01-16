//
//  Table.swift
//  emojiDictionary
//
//  Created by GEU on 07/01/26.
//

import UIKit

class Table: UITableViewCell {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var symbolLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var discriptionLabel : UILabel!
        func update(with emoji : Emoji){
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        discriptionLabel.text = emoji.description
    }
}

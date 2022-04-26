//
//  BookTableViewCell.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 26/04/2022.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookPubDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

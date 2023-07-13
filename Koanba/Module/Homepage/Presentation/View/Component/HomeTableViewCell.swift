//
//  HomeTableViewCell.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 13/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblYearMovie: UILabel!
    @IBOutlet weak var lblCategoryMovie: UILabel!
    
    static let ID = "HomeTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
}

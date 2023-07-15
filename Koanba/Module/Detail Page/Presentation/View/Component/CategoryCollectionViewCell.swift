//
//  CategoryCollectionViewCell.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 15/07/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCategories: UILabel!
    
    static let ID = "CategoryCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
    }
    
    func setData(category: String) {
        lblCategories.text = category
    }
    
    override func prepareForReuse() {
        self.lblCategories.text = ""
    }

}

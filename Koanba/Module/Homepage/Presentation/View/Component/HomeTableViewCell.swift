//
//  HomeTableViewCell.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 13/07/23.
//

import UIKit
import AlamofireImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblYearMovie: UILabel!
    
    static let ID = "HomeTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    
    private func setupView() {
        imgMovie.layer.cornerRadius = 5
    }
    
    func setData(title: String, year: String, image: String) {
        lblTitleMovie.text = title
        let stringYear = String(year.prefix(4))
        lblYearMovie.text = stringYear
        let url = "https://image.tmdb.org/t/p/w500"
        if let urlPath = URL(string: url.appending(image)) {
            DispatchQueue.main.async {
                self.imgMovie.af.setImage(withURL: urlPath)
            }
        }
    }
    
}

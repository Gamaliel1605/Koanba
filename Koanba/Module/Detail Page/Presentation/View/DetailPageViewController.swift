//
//  DetailPageViewController.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import UIKit

class DetailPageViewController: UIViewController {

    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblCategoryMovie: UILabel!
    @IBOutlet weak var lblDurationMovie: UILabel!
    @IBOutlet weak var lblDescriptionMovie: UILabel!
    @IBOutlet weak var lblTitleCast: UILabel!
    @IBOutlet weak var colView: UICollectionView!
    
    var presenter: DetailPagePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

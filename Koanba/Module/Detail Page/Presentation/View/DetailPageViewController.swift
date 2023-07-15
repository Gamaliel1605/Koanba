//
//  DetailPageViewController.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import UIKit
import AlamofireImage

class DetailPageViewController: UIViewController {

    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lblTitleMovie: UILabel!
    @IBOutlet weak var lblDescriptionMovie: UILabel!
    @IBOutlet weak var lblTitleCast: UILabel!
    @IBOutlet weak var colViewCategory: UICollectionView!
    @IBOutlet weak var colViewProduction: UICollectionView!
    
    var presenter: DetailPagePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.viewDidLoad()
    }
    
    private func setupView() {
        colViewCategory.register(CategoryCollectionViewCell.nib(), forCellWithReuseIdentifier: CategoryCollectionViewCell.ID)
        colViewProduction.register(ProductionCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductionCollectionViewCell.ID)
        colViewCategory.dataSource = self
        colViewCategory.delegate = self
        colViewProduction.dataSource = self
        colViewProduction.delegate = self
    }
    
    func renderData() {
        guard let detail = presenter?.detailMovie else { return }
        
        let url = "https://image.tmdb.org/t/p/w500"
        if let urlPath = URL(string: url.appending(detail.backgroundImage ?? "")) {
            DispatchQueue.main.async {
                self.imgDetail.af.setImage(withURL: urlPath)
            }
        }
        lblTitleMovie.text = detail.title ?? ""
        lblDescriptionMovie.text = detail.descriptionMovie ?? ""
    }

}

extension DetailPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.colViewCategory {
            return presenter?.detailMovie?.genres.count ?? 0
        } else if collectionView == self.colViewProduction {
            return presenter?.numOfProduction ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.colViewCategory {
            let cell = colViewCategory.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.ID, for: indexPath) as! CategoryCollectionViewCell
            guard let dataCategories = presenter?.detailMovie?.genres[indexPath.row] else {return UICollectionViewCell()}
            cell.setData(category: dataCategories.name ?? "")
            return cell
        } else if collectionView == self.colViewProduction {
            let cell = colViewProduction.dequeueReusableCell(withReuseIdentifier: ProductionCollectionViewCell.ID, for: indexPath) as! ProductionCollectionViewCell
            guard let dataProduction = presenter?.detailMovie?.productions[indexPath.row] else {return UICollectionViewCell()}
            cell.setData(image: dataProduction.logo_path ?? "", name: dataProduction.name ?? "")
            return cell
        }
        return UICollectionViewCell()
    }
}

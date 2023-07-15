//
//  HomeViewController.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    @IBOutlet weak var containerViewSearch: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenter?
    private let disposebag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.getMovieNowPlaying()
    }
    
    func setupView() {
        self.tfSearch.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.ID)
        self.setupStream()
    }
    
    func setupStream() {
        self.tfSearch.rx.text.orEmpty
            .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext:{ [weak self] text in
                self?.presenter?.filterData(text: text)
                self?.tableView.reloadData()

            }).disposed(by: disposebag)
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numOfMovie ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.ID, for: indexPath) as! HomeTableViewCell
        
        if let movie = presenter?.movieData[indexPath.row] {
            cell.setData(title: movie.title ?? "",
                         year: movie.releaseDate ?? "",
                         image: movie.image ?? "")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let movieID = presenter?.movieData[indexPath.row].id else {return}
        presenter?.goToDetailPage(movieID: movieID)
    }
    
}

extension HomeViewController: UITextFieldDelegate {}

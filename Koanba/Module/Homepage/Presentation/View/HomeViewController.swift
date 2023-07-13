//
//  HomeViewController.swift
//  Koanba
//
//  Created by Carlos Gamaliel on 12/07/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var containerViewSearch: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: HomeTableViewCell.ID)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.ID, for: indexPath) as! HomeTableViewCell
        
        return cell
    }
    
}

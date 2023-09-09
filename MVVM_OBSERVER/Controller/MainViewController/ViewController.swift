//
//  ViewController.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!
    
    
//MARK: - Variable initializer -------------------------------------------------------------
    var viewModel : MainViewModel = MainViewModel()
    var cellDataSource : [GetUserProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //viewModel.getUserData()
        setupTableView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getUserData()
    }
//
    
    func bindViewModel (){
        viewModel.isLoading.bind { [weak self] isloading in
            guard let self = self,let isloading = isloading else{
                return
            }
            DispatchQueue.main.async {
                if isloading {
                    self.ActivityIndicator.startAnimating()
                } else {
                    self.ActivityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] dataa in
            guard let self = self, let data = dataa else {
                return
            }
            self.cellDataSource = data
            self.tableView.reloadData()
        }
    }

    

}


//
//  MainViewController+tableView.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func setupTableView (){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registeredCell()
        
    }
    
    func registeredCell(){
        tableView.register(UINib(nibName: "UsersDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "UsersDetailTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberofSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersDetailTableViewCell", for: indexPath) as? UsersDetailTableViewCell
       
        
        let model = self.cellDataSource[indexPath.row]
        cell?.data = model
       // cell.textLabel?.text = self.cellDataSource[indexPath.row].name
        return cell!
    }
    
    
}

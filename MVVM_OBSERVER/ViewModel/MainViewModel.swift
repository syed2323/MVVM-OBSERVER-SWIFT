//
//  MainView+ViewModel.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource : Observable<[GetUserProfile]> = Observable(nil)
    var dataSource : [GetUserProfile]?
    
    
    func numberofSection() -> Int {
        return 1
    }
    
    func numberOfRows( in section: Int)-> Int {
        self.dataSource == nil ? 0 : self.dataSource!.count
    }
    
    func getUserData(){
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        NetworkManager.getUserProfile { [self] result in
            debugPrint("::::::::::")
            debugPrint(result)
            self.isLoading.value = false
            switch result {
            case .success(let data):
                self.dataSource = data
                self.mapCellData()
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func mapCellData (){
        self.cellDataSource.value = self.dataSource!
    }
}

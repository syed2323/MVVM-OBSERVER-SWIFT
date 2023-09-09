//
//  NetworkManager.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//


import Foundation
import Moya

class NetworkManager {
    
    // MARK: - GET USER PROFILE
    class func getUserProfile(completion: @escaping (APIResult<[GetUserProfile]>)->Void){
        Provider.services.request(.getUserProfile) { (result) in
            do {
                debugPrint(result)
                let response: [GetUserProfile] = try result.decoded()
                completion(.success(response))
            } catch {
                completion(.failure(error.customLocalizedError))
            }
        }
    }
}


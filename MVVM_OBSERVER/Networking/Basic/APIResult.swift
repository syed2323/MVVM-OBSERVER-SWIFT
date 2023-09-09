//
//  APIResult.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//


import Foundation
import Moya
enum APIResult<T> {
    case success(T)
    case failure(String)
}

extension Result {
    func resolve() throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
}

extension Result where Success == Moya.Response {
    func decoded<T: Decodable>(keypath: String? = nil) throws -> T {
        let decoder = JSONDecoder()
        let response = try resolve()
        return try response.map(T.self, atKeyPath: keypath, using: decoder, failsOnEmptyData: true)
    }
}



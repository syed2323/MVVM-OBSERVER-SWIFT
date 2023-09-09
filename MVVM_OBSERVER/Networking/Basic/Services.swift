//
//  Services.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//


import Foundation
import Moya

enum Services {
    case getUserProfile
}

extension Services: TargetType {
    
    var baseURL: URL {
        
        switch self {
        default:
            let urlString = ApiRouter.getBaseURL()
            return URL.init(string: urlString)!
        }
    }
    
    var path: String {
        switch self {
        case .getUserProfile:
            return "users"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserProfile:
            return .get
        default:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getUserProfile:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
//        case .updateProfilePicture:
//            return ["Content-type" : "multipart/form-data"]
        default:
            return [:]
        }
    }
    
    var validationType: ValidationType {
        var combined = [Int]()
        combined.append(contentsOf: 200..<299)
        combined.append(contentsOf: 400..<500)
        combined.append(contentsOf: 500..<599)
        return .customCodes(combined)
    }
    
}

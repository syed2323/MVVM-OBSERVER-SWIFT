//
//  ApiRouter.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import Foundation

enum Environment {
    case Production
    case Dev
    case Local
}


struct ApiRouter {
//    let isProduction: Environment = .Dev
    static func getBaseURL() -> String{
        switch isProduction {
        case .Production:
//            https://betterworldroute.com:443/
//        http://192.168.0.180:3000
            return "https://jsonplaceholder.typicode.com/"
        case .Dev:
            return "https://jsonplaceholder.typicode.com/"
        case .Local:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
}

#if PROD
let isProduction: Environment = .Production
#elseif DEV
let isProduction: Environment = .Dev
#elseif LOCAL
let isProduction: Environment = .Local
#else
let isProduction: Environment = .Dev
#endif

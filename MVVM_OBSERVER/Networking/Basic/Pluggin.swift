//
//  Pluggin.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import Foundation
import Moya
import NVActivityIndicatorView
struct Plugin {
    
    private init() {}
    
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        switch changeType {
        case .began:
            debugPrint("🌍 -->> Network Call Started... Data & Time -->> \(Date()) <<--")
//            UIApplication.stopActivityIndicator()
//            UIApplication.startActivityIndicator()
        case .ended:
           // UIApplication.stopActivityIndicator()
            debugPrint("🌍 -->> Network Call Ended... Data & Time -->> \(Date()) <<--")
        }
    })
    
    static let loggerPlugin = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
}

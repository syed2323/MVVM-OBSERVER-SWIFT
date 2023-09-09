//
//  Provider.swift
//  MVVM_OBSERVER
//
//  Created by Syed Abdul Ahad on 07/09/2023.
//

import Foundation
import Moya
import Alamofire

struct Provider {
    
    static let services = MoyaProvider<Services>(plugins: [Plugin.networkPlugin, Plugin.loggerPlugin])
    
    static let backgroundServices = MoyaProvider<Services>(plugins: [Plugin.loggerPlugin])

//    static let backgroundBlockServices = MoyaProvider<Services>(plugins: [PluginInteraction.loggerPlugin, PluginInteraction.networkPlugin])
    
//    static func getMoyaProvider(isUserInteractionEnabled: Bool = true) -> MoyaProvider<Services> {
//        return isUserInteractionEnabled ? Provider.backgroundServices:Provider.backgroundBlockServices
//    }
     
}

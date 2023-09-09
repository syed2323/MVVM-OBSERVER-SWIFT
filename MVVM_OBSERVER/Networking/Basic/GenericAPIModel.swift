//
//  GenericAPIModel.swift
//  VetsDoctoriOSSwift
//
//  Created by Raza on 10/16/20.
//  Copyright © 2020 Invision040-Raza. All rights reserved.
//

import Foundation

struct GenericAPIModel: Codable {
    
    let success: Bool?
    let statusCode: Int?
    let message: [String]?
    let status : String?
    enum CodingKeys: String, CodingKey {
        case success, message
        case statusCode = "status_code"
        case status = "status"

    }
    
}
struct GenericAPIModelV2 : Codable {

        let message : String?
        let statusCode : Int?

        enum CodingKeys: String, CodingKey {
                case message = "message"
                case statusCode = "status_code"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                message = try values.decodeIfPresent(String.self, forKey: .message)
                statusCode = try values.decodeIfPresent(Int.self, forKey: .statusCode)
        }

}

class GenericDataResponse<T: Codable>: Codable {
    
    init() {
        
    }
    
//    var response : Response?
//
//
//    enum CodingKeys: String, CodingKey {
//        case response = "response"
//    }
//
//    struct Response : Codable {
        
        var code : Int?
        var data : [T]?
        var message : [String]?
        
        enum CodingKeys: String, CodingKey {
            case code = "status_code"
            case data = "data"
            case message = "message"
        }
    required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            code = try values.decodeIfPresent(Int.self, forKey: .code)
            data = try? values.decodeIfPresent([T].self, forKey: .data)
            message = try values.decodeIfPresent([String].self, forKey: .message)
        }
//    }
}

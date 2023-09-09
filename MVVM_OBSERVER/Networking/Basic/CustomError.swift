//
//  CustomError.swift
//  BWorld
//
//  Created by Invision-102 on 2/10/22.
//

import Foundation
import Moya

// MARK: - ErrorModel
struct ErrorModel: Codable {
    let status: Int?
    let statusMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case statusMessage = "StatusMessage"
    }
}

extension Swift.Error {
    var customDescription: String {
        get {
            if let error = self as? MoyaError, let response = try? error.response?.map(ErrorModel.self) {
                return response.statusMessage ?? error.localizedDescription
            }
            return "Something went wrong"
        }
    }
    
    var customLocalizedError: String {
        get {
            if self.localizedDescription.contains("URLSessionTask failed with error:") {
                return self.localizedDescription.replacingOccurrences(of: "URLSessionTask failed with error:", with: "")
            } else if let decodingError = self as? DecodingError {
                return decodingError.failureReason ?? "Decoding Failed"
            } else {
                return "Something went wrong! Please try again later."
            }
        }
    }
    
    var decodingErrorMessage: String {
        get {
            if let error = self as? DecodingError {
                return error.failureReason ?? "Decoding Failed"
            }
            return "Something went wrong"
        }
    }
    
}

//
//  ErrorModel.swift
//  NetworkLayer
//
//  Created by Macbook Pro on 10/18/19.
//  Copyright © 2019 Bathant. All rights reserved.
//

import Foundation
open class ErrorModel: Codable {
  public let errorMessage: String
  public let errorCode : Int
    init(message: String, code:Int = 0) {
        self.errorMessage = message
        self.errorCode = code
    }
}

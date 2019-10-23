//
//  PushNotificationRequests.swift
//  NetworkSDK
//
//  Created by Macbook Pro on 10/18/19.
//  Copyright © 2019 Macbook Pro. All rights reserved.
//

import Foundation
class PushNotificationRequests {
    class func send(token: String, completion: @escaping (Result) -> Void) {
        Networking.shared.post(with: Constants.sendPushToken.rawValue, parameters: ["platform": 0, "token": token], headers: ["Content-Type": "application/json", "x-pushbots-appid": "5d258e58b7941208c73fcfb7"]) { result in
            completion(result)
        }
    }

    class func didRecieveNotification(with _: [String: AnyObject]) {
        NSLog("%@", "\(Constants.pushBotsLog.rawValue) Recieved Notification")
    }
}

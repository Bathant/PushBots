//
//  PushBots.swift
//  PushBots
//
//  Created by Macbook Pro on 10/20/19.
//  Copyright © 2019 Bathant. All rights reserved.
//

import Foundation
public class PushBots {
    private static let shared = PushBots()
    private init() {}
    private var deviceToken = ""
    public static func start(id: String) {
        print("\(Constants.pushBotsLog.rawValue): start intializing with \(id)...")
    }

    public static func register(deviceToken: Data, completion: @escaping (Result) -> Void) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        shared.deviceToken = token
        PushNotificationRequests.send(token: token) { result in
            completion(result)
        }
    }

    public static func didRecieveNotification(with aps: [String: AnyObject]) {
        PushNotificationRequests.didRecieveNotification(with: aps)
    }
}

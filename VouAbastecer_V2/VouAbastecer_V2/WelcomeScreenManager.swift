//
//  WelcomeScreenManager.swift
//  VouAbastecer_V2
//
//  Created by Tales Carvalho on 27/10/23.
//

import Foundation


class WelcomeScreenManager {
    private let hasSeenWelcomeKey = "hasSeenWelcome"

    var hasSeenWelcome: Bool {
        get {
            UserDefaults.standard.bool(forKey: hasSeenWelcomeKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: hasSeenWelcomeKey)
        }
    }
}

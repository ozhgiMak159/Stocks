//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Maksim  on 02.02.2024.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    public var watchList: [String] {
        return []
    }
    
    private var hasOnboarded: Bool {
        return false
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    
    
}

//
//  CacheManager.swift
//  HTTubeApp
//
//  Created by Thạnh Dương Hoàng on 3/2/25.
//

import Foundation

class CacheManager {
    
    static var cache = [String: Data]()
    
    static func setCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getCache(_ url: String) -> Data? {
        return cache[url]
    }
    
}

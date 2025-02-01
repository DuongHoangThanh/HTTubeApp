//
//  Response.swift
//  HTTubeApp
//
//  Created by Thạnh Dương Hoàng on 1/2/25.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
        case items
        
    }
    
    init (from decode: Decoder) throws {
        
        let container = try decode.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}

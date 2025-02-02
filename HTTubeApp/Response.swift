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
    
    /// Decoder: Đây là một giao thức (protocol) của Swift, được dùng để chuyển đổi dữ liệu từ JSON sang các kiểu dữ liệu Swift. Đối tượng Decoder này được JSONDecoder truyền vào khi decode JSON.
    /// Khi gọi JSONDecoder.decode(Response.self, from: data!), nó sẽ tự động gọi hàm init(from:) của Response để decode.
    
    init (from decode: Decoder) throws {
        
        let container = try decode.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
    
}

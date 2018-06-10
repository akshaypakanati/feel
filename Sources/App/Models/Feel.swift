//
//  Feel.swift
//  App
//
//  Created by Akshay on 6/10/18.
//

import Meow
import Vapor

final class Feel: Model, Content {
    
    var _id = ObjectId()
    
    var date: Date
    var value: Int
    
    init(value: Int) {
        self.value = value
        self.date = Date()
    }
    
    static func fetchAllFeels(for filter:FeelFilters) throws -> [Feel] {
        
        let feels = try Feel.find("value" == filter.value)
        return Array(feels)
    }
    
}


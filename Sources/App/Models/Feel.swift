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
    var weekday: Int
    var value: Int
    
    init(value: Int) {
        
        self.value = value
        self.date = Date()
        
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        weekday = gregorianCalendar.component(.weekday, from: date)
        
    }
    
    static func fetchAllFeels(for filter:FeelFilters) throws -> [Feel] {
        
        let feels = try Feel.find("value" == filter.value)
        return Array(feels)
    }
    
    static func feels() throws {
        
        let pieline : AggregationPipeline = [
            .group(groupDocument: [
                "_id": "$value",
                "count" : ["$sum":1]]),
            .sort(["_id":.ascending])
        ]
        
        let _ = try Feel.collection.aggregate(pieline).flatMap(transform: { doc in
            print(doc.debugDescription)
        })
       
    }
    
}

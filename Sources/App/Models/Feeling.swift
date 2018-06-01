//
//  Feeling.swift
//  App
//
//  Created by Akshay Pakanati on 5/31/18.
//

import Meow
import Vapor

class Feeling: Model, Codable {

    var _id = ObjectId()
    var date = Date()
    
    var feelIndex : Int
    
    init(index:Int) {
        feelIndex = index
    }
}

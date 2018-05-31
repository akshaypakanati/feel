//
//  CreateFeelRequest.swift
//  App
//
//  Created by Akshay Pakanati on 5/31/18.
//

import Vapor

struct CreateFeelRequest : Content {
    static let defaultContentType: MediaType = .json
    let feelIndex : Int
}

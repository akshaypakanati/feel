//
//  FeelController.swift
//  App
//
//  Created by Akshay Pakanati on 5/31/18.
//

import Vapor

final class FeelController {
    func create(_ req:Request) throws -> Future<HTTPStatus> {
        return try req.content.decode(CreateFeelRequest.self).map { createFeel in
            
            if createFeel.feelIndex < 0 || createFeel.feelIndex > 5  {
                return .badRequest
            } else {
                let feel = Feeling(index: createFeel.feelIndex)
                try feel.save()
                return .ok
            }
        }
    }
    
    func get(_ req:Request) throws -> HTTPStatus {
        
        let param = try req.parameters.next(String.self)
        print(param)
        return .ok
        
    }
    
}

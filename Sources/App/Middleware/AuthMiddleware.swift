//
//  AuthMiddleware.swift
//  App
//
//  Created by Akshay Pakanati on 6/1/18.
//

import Vapor
import HTTP

class AuthMiddleware:Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> EventLoopFuture<Response> {
        return try next.respond(to: request)
    }
}

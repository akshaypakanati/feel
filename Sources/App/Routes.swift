import Routing
import Vapor
import Leaf

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)

public func routes(_ router: Router) throws {
    
    
    //Save a feeling
    router.post("saveFeel") { (request) -> Future<Feel> in
        return try request.content.decode(NewFeelRequest.self).map(to: Feel.self) { newFeel in
            
            if newFeel.feel < 0 || newFeel.feel > 5 {
                throw HTTPError(identifier: "Vapor", reason: "Invalid request")
            }            
            let feel = Feel(value: newFeel.feel)
            try feel.save()
            return feel
        }
    }
    
    //Fetch Feelings
    router.get("feels") { (request) -> [Feel] in
        
        let filters = try request.query.decode(FeelFilters.self)
        return try Feel.fetchAllFeels(for:filters)
        
    }
    
    router.get { req -> Future<View> in
        let leaf = try req.make(LeafRenderer.self)
        
        let feels = try Feel.feels()
        
        //let context = [String: String]()
        return leaf.render("home", ["feels":feels])
        
    }
}

import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    
    
    //Save a feeling
    router.post("saveFeel") { (request) -> Future<HTTPStatus> in
        return try request.content.decode(NewFeelRequest.self).map(to: HTTPStatus.self) { newFeel in
            
            if newFeel.feel < 0 || newFeel.feel > 5 {
                return .expectationFailed
            }
            
            let feel = Feel(value: newFeel.feel)
            try feel.save()
            return .ok
        }
    }
    
    //Fetch Feelings
    router.get("feels") { (request) -> [Feel] in
        
        let filters = try request.query.decode(FeelFilters.self)
        return try Feel.fetchAllFeels(for:filters)
        
    }

}

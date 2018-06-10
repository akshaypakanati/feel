import Routing
import Vapor
import Meow


/// Called after your application has initialized.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#bootswift)
public func boot(_ app: Application) throws {
    // your code here
    try Meow.init("mongodb://vapor:vapor@feel-cluster-shard-00-00-ijsce.mongodb.net:27017,feel-cluster-shard-00-01-ijsce.mongodb.net:27017,feel-cluster-shard-00-02-ijsce.mongodb.net:27017/feel?ssl=true&replicaSet=feel-cluster-shard-0&authSource=admin&retryWrites=true")

}

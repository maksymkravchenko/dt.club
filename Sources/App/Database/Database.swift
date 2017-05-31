//import Vapor
//import MongoKitten
//
//class Database {
//	static let database = Database(username: Env.user, password: Env.password, host: Env.host, port: Env.port)!
//	
//	
//	var server: MongoKitten.Server
//	var db: MongoKitten.Database
//	var todos: MongoKitten.Collection
//	
//	init?(username: String, password: String, host: String, port: String) {
//		do {
//			server = try Server("mongodb://\(username):\(password)@\(host):\(port)", automatically: true)
//			db = server[Env.MongoDbName]
//			todos = db["todos"]
//			
//		} catch {
//			print("MongoDB is not available on the given host and port")
//			return nil
//		}
//	}
//}




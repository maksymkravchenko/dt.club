import App
import MongoKitten

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands, 
/// if no command is given, it will default to "serve"
let config = try Config()
try config.setup()

let drop = try Droplet(config)
try drop.setup()

let server = try Server("mongodb://max:design2017@ds157621.mlab.com:57621")
let db = server["designtalkclub"]
let todos = db["emails"]

if db.server.isConnected {
	print("connected")
} else {
	print("db fail")
}


let database = server["mydatabasename"]


try drop.run()

struct Env {
	static let user = drop.config["app", "user"]!.string!
	static let password = drop.config["app", "password"]!.string!
	static let database = drop.config["app", "database"]!.string!
	static let host = drop.config["app", "host"]!.string!
	static let port = drop.config["app", "port"]!.string!
}

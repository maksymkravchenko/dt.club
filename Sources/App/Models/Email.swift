import Vapor
import FluentProvider
import HTTP

final class Email: Model {
	let storage = Storage()
	
	
	var email: String
//	var date: Date? = nil
	//	var webInfo: Any
	
	init(email: String) {
		self.email = email
//		self.date = Date()
		
//		self.webInfo = "not porvided yet"
	}
	
	// MARK: Fluent Serialization
	
	/// Initializes the Post from the
	/// database row
	init(row: Row) throws {
		email = try row.get("content")
		print(email)
//		date = try row.get("date")
	}
	
	// Serializes the Post to the database
	func makeRow() throws -> Row {
		var row = Row()
		try row.set("email", email)
//		try row.set("date", date)
		
		return row
	}
	
}

// MARK: Fluent Preparation

extension Email: Preparation {
	/// Prepares a table/collection in the database
	/// for storing Posts
	static func prepare(_ database: Database) throws {
		try database.create(self) { builder in
			builder.id()
			builder.string("email")
//			builder.date("date")
		}
	}
	
	/// Undoes what was done in `prepare`
	static func revert(_ database: Database) throws {
		try database.delete(self)
	}
}

// MARK: JSON

// How the model converts from / to JSON.
// For example when:
//     - Creating a new Post (POST /posts)
//     - Fetching a post (GET /posts, GET /posts/:id)
//
extension Email: JSONConvertible {
	convenience init(json: JSON) throws {
		try self.init(
			email: json.get("email")
//			date: json.get("date")
		)
	}
	
	func makeJSON() throws -> JSON {
		var json = JSON()
		try json.set("id", id)
		try json.set("email", email)
		//		try json.set("date", date)
		return json
	}
}

// MARK: HTTP

// This allows Post models to be returned
// directly in route closures
extension Email: ResponseRepresentable { }


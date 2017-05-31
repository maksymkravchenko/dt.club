import Vapor
import HTTP

final class EmailController: ResourceRepresentable {
	
	
	func index(request: Request) throws -> ResponseRepresentable {
		let result = try Email.all().map { try $0.makeJSON() }
		return JSON(result)
	}
	
	func create(request: Request) throws -> ResponseRepresentable {
		
		guard let email = request.data["email"]?.string else {
			throw Abort(.preconditionFailed, reason: "Missing email")
		}
		let user = Email(email: email)
		try user.save()
		return try user.makeJSON()
		//		let post = try request.post()
		//		try post.save()
		//		return post
	}
	
	
	func makeResource() -> Resource<Post> {
		return Resource(
			index: index,
			store: create
		)
	}
	
}


extension EmailController: EmptyInitializable { }


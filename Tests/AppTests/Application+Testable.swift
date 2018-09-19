@testable import App
import Vapor
import FluentPostgreSQL

extension Application {
  static func testable() throws -> Application {
    var config = Config.default()
    var services = Services.default()
    var env = Environment.testing
    try App.configure(&config, &env, &services)
    let app = try Application(config: config, environment: env, services: services)
    try App.boot(app)

    return app
  }

  func sendRequest<Body>(to path: String,
                         method: HTTPMethod,
                         headers: HTTPHeaders = .init(),
                         body: Body?)
                         throws -> Response where Body: Content {
        let httpRequest = HTTPRequest(method: method, url: URL(string: path)!, headers: headers)
        let wrappedRequest = Request(http: httpRequest, using: self)
        let responder = try make(Responder.self)

        return try responder.respond(to: wrappedRequest).wait()
  }

  func makeLibrariesBooksRequest(with id: Int) throws -> Response {
    let body : EmptyBody? = nil
    return try self.sendRequest(to: "/libraries/\(id)/books",
                               method: .GET,
                               body: body)
  }

  func makeLibrariesRequest() throws -> Response {
    let body : EmptyBody? = nil
    return try self.sendRequest(to: "/libraries", method: .GET, body: body)
  }
}

struct EmptyBody: Content {}

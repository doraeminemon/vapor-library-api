import Vapor
import FluentPostgreSQL

final class Book : PostgreSQLModel {
  var id        : Int?
  var title     : String
  var library_id: Int

  init(id: Int? = nil, title: String, library_id: Int) {
      self.id         = id
      self.title      = title
      self.library_id = library_id
  }
}

extension Book: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Book: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Book: Parameter { }
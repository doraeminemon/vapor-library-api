import Vapor
import FluentPostgreSQL

final class Library : PostgreSQLModel {
  var id: Int?
  var title: String

  init(id: Int? = nil, title: String) {
      self.id = id
      self.title = title
  }
}

extension Library: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Library: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Library: Parameter { }
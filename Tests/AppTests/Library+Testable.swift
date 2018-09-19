@testable import App
import FluentPostgreSQL

extension Library {
  static func create(title: String, on conn: PostgreSQLConnection) throws -> Library {
    let lib = Library(title: title)
    return try lib.save(on: conn).wait()
  }
}
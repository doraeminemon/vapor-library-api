@testable import App
import FluentPostgreSQL

extension Book {
  static func create(title: String,
                     library_id: Int,
                     on conn: PostgreSQLConnection)
                     throws -> Book {
    let book = Book(title: title, library_id: library_id)
    return try book.save(on: conn).wait()
  }
}
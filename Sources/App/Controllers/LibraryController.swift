import Vapor

/// Controlers basic CRUD operations on `Library`s.
final class LibraryController {
    /// Returns a list of all `Library`s.
  func index(_ req: Request) throws -> Future<[Library]> {
      return Library.query(on: req).all()
  }

  /// Returns a list of all `Book`s belong to a `Library`
  func books(_ req: Request) throws -> Future<[Book]> {
    let library_id: Int = try req.parameters.next(Int.self)
    let logger          = try req.make(Logger.self)
    let books           = Book
      .query(on: req)
      .all()
      .map{ books in
          return books.filter{$0.library_id == library_id}
      }
    return books
  }
}

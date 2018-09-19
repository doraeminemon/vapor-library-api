import Vapor

/// Controlers basic CRUD operations on `Library`s.
final class LibraryController {
    /// Returns a list of all `Library`s.
    func index(_ req: Request) throws -> Future<[Library]> {
        return Library.query(on: req).all()
    }

    // /// Returns a list of all `Book`s belong to a `Library`
    // func books(_ req: Request) throws -> Future<[Book]> {
    //   let library_id = 1
    //   return Book.filter(\.name == library_id).all()
    // }
}

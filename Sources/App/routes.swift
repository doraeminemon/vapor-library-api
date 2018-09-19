import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let libController = LibraryController()
    router.get("libraries", use: libController.index)
    // router.get("libraries/:id/books", use: libController.books)
}

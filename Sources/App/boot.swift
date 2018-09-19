import Vapor

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
}

/*

    let conn = try! app.newConnection(to: .psql).wait()
    let libraries_title = ["Alexandra", "Babel"]
    let libraries = try libraries_title.map { title in
        return try Library(title: title)
            .save(on: conn)
            .wait()
    }
    let books_title = ["Odyssey", "Romeo and Juliette"]
    let books = try books_title.map { title in
        return try Book(title: title, library_id: libraries[0].id!)
            .save(on:conn)
            .wait()
    }
*/

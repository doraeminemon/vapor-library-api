import FluentPostgreSQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
    try services.register(FluentPostgreSQLProvider())

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let postgresqlConfig = PostgreSQLDatabaseConfig(
        hostname: env == .production ? "library-api-db" : "127.0.0.1",
        port: 5432,
        username: "postgres",
        database: env == .testing ?
        "library_api_test" : "library_api",
        password: "postgres"
    )
    services.register(postgresqlConfig)

    /// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Todo.self, database: .psql)
    migrations.add(model: Library.self, database: .psql)
    migrations.add(model: Book.self, database: .psql)
    services.register(migrations)

}

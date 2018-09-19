# Library API

## Description
A sample Vapor app which provide 2 simple API :
- libraries : return all libraries
- libraries/:id/books : return all books belongs to a library with :id

## Todo
- [x] Libraries API
- [x] Libraries API test
- [x] Library/books API
- [x] Library/books API tests
- [x] Use dependency injection in test examples
- [x] Docker compose running
- [x] Docker build command
- [x] Sample info in postgres-data volume
- [ ] Create docker image for development purpose
- [ ] Create docker image for testing purpose
- [x] Upload to github

## Usage

- Develop normally in Sources folder
- Build the image using `$ make build`
- Run the actual production environment image using `$ docker-compose up`
- Backup the volume using `$ make backup`
- Restore the backup volume using `$ make restore`
- Run locally by editing :
    - docker-compose port mapping to internal
    - Uncomment sample data in `boot.swift` file
import Foundation

struct AppGrouop: Decodable {
    let id: String
    let titulo: String
    let apps: [App]
}

import SwiftUI

struct Brand: Codable {
    var name: String
    var token: String
    var products: [Product]?
}

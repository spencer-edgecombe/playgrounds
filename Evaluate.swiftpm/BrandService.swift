import SwiftUI
import Combine

class BrandService {
    private let url = URL(fileReferenceLiteralResourceName: "brand.json")
    init() {
        fetchBrand()
    }
    private var subcriptions = Set<AnyCancellable>()
    
    func fetchBrand() -> AnyPublisher<Brand, Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Brand.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

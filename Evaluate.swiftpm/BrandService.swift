import SwiftUI
import Combine

class BrandService {
    private let url = URL(fileReferenceLiteralResourceName: "brand.json")
    init() {
        fetchBrand()
    }
    private var subcriptions = Set<AnyCancellable>()
    func fetchBrand() {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Brand.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { brand in
                print(brand)
            }
            .store(in: &subcriptions)
    }
}

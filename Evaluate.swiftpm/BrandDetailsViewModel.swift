import SwiftUI
import Combine

class BrandDetailsViewModel: ObservableObject {
    @Published var viewState: BrandDetailsView.ViewState
    
    private var brandService: BrandService = BrandService()
    private var viewStateSubject = PassthroughSubject<BrandDetailsView.ViewState, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        viewState = BrandDetailsView.ViewState(mode: .loading)
        
        brandService.fetchBrand()
            .map(mapBrandToViewState(_:))
            .sink { _ in
                // Handle Error
            } receiveValue: { [weak self] brand in
                self?.viewStateSubject.send(brand)
                print(brand)
            }
            .store(in: &subscriptions)
        
        viewStateSubject.receive(on: RunLoop.main, options: nil).assign(to: &$viewState)
    }

    func mapBrandToViewState(_ brand: Brand) -> BrandDetailsView.ViewState {
        BrandDetailsView.ViewState(
            mode: .content(
                BrandDetailsView.Content(
                    brandToken: brand.token,
                    brandNameText: brand.name,
                    productCellViewStates: brand.products?.map(mapProductToCellViewState(_:)) ?? [ProductCell.ViewState]()
                )
            )
        )
    }
    
    func mapProductToCellViewState(_ product: Product) -> ProductCell.ViewState {
        ProductCell.ViewState(
            productToken: product.token,
            productNameText: product.name,
            productPriceText: "$\(product.price)",
            productImageURL: URL(string: product.image)
        )
    }
}

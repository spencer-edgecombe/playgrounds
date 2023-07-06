import SwiftUI

struct BrandDetailsView: View {
    var body: some View {
        EmptyView()
    }
}

extension BrandDetailsView {
    enum Mode {
        case loading
        case content(Content)
    }    
}

extension BrandDetailsView {
    struct Content {
        let brandToken: String
        let brandNameText: String
        let productCellViewStates: [ProductCell.ViewState]
    }
}

extension BrandDetailsView {
    struct ViewState {
        let mode: Mode
    }
}

struct ProductCell: View {
    var body: some View {
        EmptyView()
    }
}

extension ProductCell {
    struct ViewState {
        let productToken: String 
        let productNameText: String
        let productPriceText: String
        let productImageURL: URL?
    }
}

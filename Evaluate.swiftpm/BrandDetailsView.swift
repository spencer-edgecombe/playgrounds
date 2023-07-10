import SwiftUI

struct BrandDetailsView: View {
    @ObservedObject var viewModel: BrandDetailsViewModel = .init()
    var body: some View {
        switch viewModel.viewState.mode {
        case .loading:
            Text("Hey")
                .navigationTitle("Loading")
                .navigationBarHidden(false)
        case .content(let content):
            Text("Hey")
                .navigationTitle(content.brandNameText)
                .navigationBarHidden(false)
        }
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

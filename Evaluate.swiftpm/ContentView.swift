import SwiftUI

class ViewModel: ObservableObject {
    
    @Published private(set) var isLightOn = false
    private var brandViewModel = BrandDetailsViewModel()
    init() {
    }
    
    func toggleLightSwitch() {
        isLightOn.toggle()
    }
 }

struct ContentView: View {
    var body: some View {
        NavigationStack {
            BrandDetailsView()
        }
    }
}

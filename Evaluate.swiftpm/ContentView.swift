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
    var onColor: Color = .yellow
    var offColor: Color = .gray

    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "lightbulb")
                .imageScale(.large)
                .font(.system(size: 150))
                .foregroundColor(viewModel.isLightOn ? onColor : offColor)
            Button("Light Switch") {
                viewModel.toggleLightSwitch()
            }
        }
    }
}

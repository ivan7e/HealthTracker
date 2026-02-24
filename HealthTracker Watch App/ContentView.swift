//
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HealthViewModel()
    
    var body: some View {
        NavigationStack {
            MainDashboardView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}

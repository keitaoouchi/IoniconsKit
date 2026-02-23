import SwiftUI
import IoniconsKit

/// A SwiftUI example view that demonstrates IoniconView usage.
struct IoniconsSwiftUIView: View {

    @State private var searchText = ""

    private var filteredItems: [(String, Ionicons)] {
        if searchText.isEmpty {
            return Ionicons.tuples
        }
        return Ionicons.tuples.filter { $0.0.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            List(filteredItems, id: \.0) { name, icon in
                HStack(spacing: 16) {
                    IoniconView(icon, color: .accentColor, size: 24)
                        .frame(width: 32, height: 32)
                    Text(name)
                        .font(.system(.body, design: .monospaced))
                }
            }
            .navigationTitle("SwiftUI")
            .searchable(text: $searchText, prompt: "Search icons")
        }
    }
}

#Preview {
    IoniconsSwiftUIView()
}

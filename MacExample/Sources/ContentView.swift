import SwiftUI
import IoniconsKit

struct ContentView: View {

    @State private var searchText = ""
    @State private var selected: Ionicons? = nil

    private var filteredIcons: [Ionicons] {
        guard !searchText.isEmpty else { return Ionicons.allCases }
        return Ionicons.allCases.filter {
            String(describing: $0).localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredIcons, id: \.self, selection: $selected) { icon in
                HStack(spacing: 12) {
                    IoniconView(icon, color: .accentColor, size: 22)
                        .frame(width: 28, height: 28)
                    Text(String(describing: icon))
                        .font(.system(.body, design: .monospaced))
                }
            }
            .navigationTitle("Icons (\(filteredIcons.count))")
        } detail: {
            if let icon = selected {
                IconDetailView(icon: icon)
            } else {
                Text("Select an icon")
                    .foregroundStyle(.secondary)
            }
        }
        .searchable(text: $searchText, prompt: "Search icons")
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct IconDetailView: View {

    let icon: Ionicons

    var body: some View {
        VStack(spacing: 24) {
            IoniconView(icon, color: .accentColor, size: 80)
            Text(String(describing: icon))
                .font(.system(.title2, design: .monospaced))
            HStack(spacing: 16) {
                ForEach([20, 32, 48, 64] as [CGFloat], id: \.self) { size in
                    VStack(spacing: 4) {
                        IoniconView(icon, size: size)
                        Text("\(Int(size))pt")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding(40)
    }
}

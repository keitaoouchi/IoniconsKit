import SwiftUI
import IoniconsKit

/// A SwiftUI example view that demonstrates IoniconView usage.
@available(iOS 13.0, *)
struct IoniconsSwiftUIView: View {

    private let items: [(String, Ionicons)] = Ionicons.tuples

    var body: some View {
        NavigationView {
            List(items, id: \.0) { name, icon in
                HStack(spacing: 16) {
                    IoniconView(icon, color: .accentColor, size: 24)
                        .frame(width: 32, height: 32)
                    Text(name)
                        .font(.system(.body, design: .monospaced))
                }
            }
            .navigationTitle("Ionicons v4")
        }
    }
}

@available(iOS 13.0, *)
struct IoniconsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        IoniconsSwiftUIView()
    }
}

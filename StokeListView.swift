import SwiftUI

struct StokeListView: View {
    let category: String
    let stokes: [Stoke]

    var body: some View {
        List(stokes.filter { $0.category == category }) { stoke in
            NavigationLink(destination: StokeDetailView(stoke: stoke)) {
                VStack(alignment: .leading) {
                    Text(stoke.name)
                        .font(.headline)
                    Text("Participants: \(stoke.participants)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("Use this to: \(stoke.purpose)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 5)
            }
        }
        .navigationTitle("\(category) Stokes")
    }
}


import SwiftUI

struct CategoryStocksView: View {
    let category: String
    let stokes: [Stoke]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(category)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .foregroundColor(.primary)

            ScrollView {
                VStack(spacing: 15) {
                    ForEach(stokes.filter { $0.category == category }) { stoke in
                        StokeCardView(stoke: stoke)
                    }
                }
                .padding(.horizontal)
            }
            .background(Color(UIColor.systemGroupedBackground))
        }
        .navigationTitle("\(category) Stokes")
        .navigationBarTitleDisplayMode(.inline)
    }
}


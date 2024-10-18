import SwiftUI

// Updated CategoryCardView to navigate to CategoryStocksView
struct CategoryCardView: View {
    let title: String
    let color: LinearGradient
    let members: String
    let icon: String

    var body: some View {
        NavigationLink(destination: CategoryStocksView(category: title, stokes: stokeList)) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color.black.opacity(0.2))
                        .clipShape(Circle())
                    Spacer()
                }

                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(members)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .frame(width: 140, height: 120)
            .background(color)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
        }
    }
}


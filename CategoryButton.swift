import SwiftUI

// Updated CategoryButton to navigate to CategoryStocksView
struct CategoryButton: View {
    let title: String
    let color: Color
    let icon: String

    var body: some View {
        NavigationLink(destination: CategoryStocksView(category: title, stokes: stokeList)) {
            VStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(width: 140, height: 120)
            .background(color)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
        }
    }
}


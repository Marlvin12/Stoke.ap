
import Foundation
import SwiftUI

struct StokeOfTheDayCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.green.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 5)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 10) {
                Text("Stoke of the Day")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.green)

                Text("Soundball")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                Text("Boost energy and create focus with this engaging activity!")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Button(action: {
                    // Action for Learn More
                }) {
                    Text("Learn More")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top, 5)
            }
            .padding()
        }
        .frame(height: 200)
    }
}

struct StokeOfTheDayCard_Previews: PreviewProvider {
    static var previews: some View {
        StokeOfTheDayCard()
            .previewLayout(.sizeThatFits)
    }
}

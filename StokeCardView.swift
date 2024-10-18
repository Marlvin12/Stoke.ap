
import Foundation

import SwiftUI

struct StokeCardView: View {
    let stoke: Stoke

    var body: some View {
        NavigationLink(destination: StokeDetailView(stoke: stoke)) {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)

                HStack {
                    Image(systemName: iconForCategory(stoke.category))
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .padding()

                    VStack(alignment: .leading, spacing: 5) {
                        Text(stoke.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)

                        Text(stoke.purpose)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)

                        Text("Participants: \(stoke.participants)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()

                    Image(systemName: "chevron.right.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                        .padding(.trailing)
                }
                .padding()
            }
            .frame(height: 120)
            .padding(.vertical, 5)
        }
        .buttonStyle(PlainButtonStyle()) // This ensures that the NavigationLink looks like a regular view
    }
}

// Helper function to return an icon for the category
func iconForCategory(_ category: String) -> String {
    switch category {
    case "Warm-Up":
        return "flame.fill"
    case "Problem-Solving":
        return "puzzlepiece.fill"
    case "Empathy":
        return "person.3.fill"
    case "Creativity":
        return "paintbrush.fill"
    default:
        return "lightbulb.fill"
    }
}

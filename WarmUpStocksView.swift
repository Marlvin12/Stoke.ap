import SwiftUI

struct WarmUpStocksView: View {
    let warmUpStocks = [
        StockItem(name: "Soundball", description: "Create focus and boost energy with a fun activity.", icon: "circle.grid.cross.fill"),
        StockItem(name: "One Word Proverbs", description: "Nurture camaraderie and sharpen focus.", icon: "text.quote"),
        StockItem(name: "Yes, and...", description: "Build mindset and energy through collaboration.", icon: "person.3.fill"),
        StockItem(name: "Long Lost Friends", description: "Energize and bond with team members.", icon: "person.2.circle.fill")
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text("Warm-Up Stokes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding([.top, .horizontal])
                    .foregroundColor(.primary)

                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(warmUpStocks) { stock in
                            StockCardView(stock: stock)
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color(UIColor.systemGroupedBackground))
            }
            .navigationTitle("Warm-Up Stocks")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Card Component for each stock
struct StockCardView: View {
    let stock: StockItem

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)

            HStack {
                Image(systemName: stock.icon)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()

                VStack(alignment: .leading, spacing: 5) {
                    Text(stock.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)

                    Text(stock.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                Spacer()

                Button(action: {
                    // Action to view stock details
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                .padding(.trailing)
            }
            .padding()
        }
        .frame(height: 100)
        .padding(.vertical, 5)
    }
}

// Data model for Stock Item
struct StockItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
}

struct WarmUpStocksView_Previews: PreviewProvider {
    static var previews: some View {
        WarmUpStocksView()
            .preferredColorScheme(.light)
        WarmUpStocksView()
            .preferredColorScheme(.dark)
    }
}


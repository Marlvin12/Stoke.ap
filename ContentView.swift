import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    // Header
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // Daily Stoke Card
                    DailyStokeCard()
                    
                    // Categories
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Categories")
                            .font(.headline)
                        
                        VStack(spacing: 15) {
                            HStack(spacing: 15) {
                                CategoryButton(title: "Warm-Up", color: Color.orange, icon: "flame.fill")
                                CategoryButton(title: "Problem-Solving", color: Color.blue, icon: "puzzlepiece.fill")
                            }
                            HStack(spacing: 15) {
                                CategoryButton(title: "Empathy", color: Color.purple, icon: "person.2.fill")
                                CategoryButton(title: "Creativity", color: Color.pink, icon: "paintbrush.fill")
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DailyStokeCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Today's Stoke")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Team Building Exercise")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("15 min • Collaboration")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


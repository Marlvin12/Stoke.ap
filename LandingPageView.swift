import SwiftUI

struct LandingPageView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Hero Section with Greeting and Profile
                    ZStack {
                        Image("hero")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 220)
                            .clipped()
                            .overlay(Color.black.opacity(0.4))

                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Hello, User!")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)

                                Text("What would you like to do today?")
                                    .font(.headline)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                            Spacer()
                            Image("profile-avatar")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        }
                        .padding()
                    }

                    // Search Bar
                    HStack {
                        TextField("Search Activities...", text: .constant(""))
                            .padding(10)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, -20)

                    // Suggested for You Section
                    VStack(alignment: .leading) {
                        Text("Suggested for you")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                CategoryCardView(
                                    title: "Warm-Up",
                                    color: LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom),
                                    members: "20 Activities",
                                    icon: "flame.fill"
                                )
                                CategoryCardView(
                                    title: "Problem-Solving",
                                    color: LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom),
                                    members: "17 Activities",
                                    icon: "puzzlepiece.fill"
                                )
                                CategoryCardView(
                                    title: "Creativity",
                                    color: LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .top, endPoint: .bottom),
                                    members: "12 Activities",
                                    icon: "paintbrush.fill"
                                )
                            }
                            .padding(.horizontal)
                        }
                    }

                    // Popular Activities Section
                    VStack(alignment: .leading) {
                        Text("Popular Activities")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ActivityCardView(title: "Soundball", description: "Boost your energy", color: .purple)
                                ActivityCardView(title: "Yes, and...", description: "Get creative with this", color: .blue)
                                ActivityCardView(title: "Long Lost Friends", description: "Build strong connections", color: .green)
                            }
                            .padding(.horizontal)
                        }
                    }

                    Spacer()

                    // Bottom Navigation Bar with Updated Icons
                    HStack {
                        NavigationLink(destination: HomeView()) {
                            VStack {
                                Image(systemName: "house.fill")
                                Text("Home").font(.caption)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: TaskManagerView()) {
                            VStack {
                                Image(systemName: "text.badge.checkmark")
                                Text("Task").font(.caption)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: PomodoroView()) {
                            VStack {
                                Image(systemName: "clock.fill")
                                Text("Pomodoro").font(.caption)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: JournalView()) {
                            VStack {
                                Image(systemName: "book.fill")
                                Text("Journal").font(.caption)
                            }
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
        }
    }
}

// Custom View for Activity Cards
struct ActivityCardView: View {
    let title: String
    let description: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
        }
        .padding()
        .frame(width: 150, height: 100)
        .background(color)
        .cornerRadius(12)
        .shadow(color: color.opacity(0.3), radius: 5, x: 0, y: 4)
    }
}





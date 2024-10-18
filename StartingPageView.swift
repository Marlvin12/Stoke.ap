import SwiftUI

struct StartingPageView: View {
    @State private var navigateToLanding = false

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // Custom image for the starting page with improved UI
                Image("startingpage")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .padding(.horizontal)

                // Headline text with modern styling
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Text("Build Stronger Teams, Wherever You Are")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .multilineTextAlignment(.center)
                    )
                    .padding(.top, 20)
                    .padding(.horizontal)

                // Subtitle text with a cleaner and modern font
                Text("Discover new ways to connect and collaborate with your team.")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(Color.gray.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 8)

                Spacer()

                // Get started button
                Button(action: {
                    navigateToLanding = true
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(12)
                        .shadow(color: Color.green.opacity(0.4), radius: 8, x: 0, y: 4)
                        .padding(.horizontal, 40)
                }
                .navigationDestination(isPresented: $navigateToLanding) {
                    LandingPageView() // Navigate to the LandingPageView once the button is tapped
                }

                // Skip link
                Button(action: {
                    navigateToLanding = true
                }) {
                    Text("Skip")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }

                Spacer()
            }
            .background(Color(UIColor.systemBackground).ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

struct StartingPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartingPageView()
    }
}


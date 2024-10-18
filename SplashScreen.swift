import SwiftUI
struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        VStack {
            if isActive {
                StartingPageView() // Navigate to StartingPageView once the splash screen is done
            } else {
                VStack {
                    
                    Image(systemName: "bicycle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .foregroundColor(.green)
                        
                    
                    Text("Stoke.ap")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
            }
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}


import Foundation

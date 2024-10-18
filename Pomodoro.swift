import Foundation
import SwiftUI

struct PomodoroView: View {
    @State private var timerDuration: Int = 1500
    @State private var timeRemaining: Int = 1500
    @State private var timerRunning = false
    @State private var pomodoroSessions = 0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
           
            Color.green.opacity(0.2)
                .edgesIgnoringSafeArea(.all)

            VStack {
              
                Text("Pomodoro Timer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 40)

               
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(timeRemaining) / CGFloat(timerDuration))
                        .stroke(Color.green, lineWidth: 10)
                        .frame(width: 250, height: 250)
                        .rotationEffect(.degrees(-90))
                        .animation(.easeInOut, value: timeRemaining)

                    Text(timeString(time: timeRemaining))
                        .font(.system(size: 48, weight: .bold, design: .monospaced))
                        .foregroundColor(Color.black)
                }
                .padding(.top, 30)

        
                HStack(spacing: 20) {
                    Button(action: startTimer) {
                        Image(systemName: "play.fill")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }

                    Button(action: pauseTimer) {
                        Image(systemName: "pause.fill")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }

                    Button(action: resetTimer) {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                }
                .padding(.top, 30)

                // Pomodoro sessions completed display
                Text("Pomodoro Sessions Completed: \(pomodoroSessions)")
                    .font(.headline)
                    .padding(.top, 20)
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()
            .onDisappear { stopTimer() }
        }
    }

    // Function to start the timer
    private func startTimer() {
        if timerRunning == false {
            timerRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    
                    pomodoroSessions += 1
                    resetTimer()
                }
            }
        }
    }

    
    private func pauseTimer() {
        timer?.invalidate()
        timerRunning = false
    }

    
    private func resetTimer() {
        timer?.invalidate()
        timeRemaining = timerDuration
        timerRunning = false
    }

  
    private func stopTimer() {
        timer?.invalidate()
    }


    private func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct PomodoroView_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroView()
    }
}


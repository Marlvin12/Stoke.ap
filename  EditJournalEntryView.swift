import SwiftUI

struct EditJournalEntryView: View {
    @Binding var entry: JournalEntry
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("How are you feeling today?")
                    .font(.headline)
                    .padding(.top, 20)

                // Mood Button Stack
                HStack(spacing: 10) {
                    MoodButton(title: "Awesome", mood: $entry.mood)
                    MoodButton(title: "Happy", mood: $entry.mood)
                    MoodButton(title: "Okay", mood: $entry.mood)
                    MoodButton(title: "Bad", mood: $entry.mood)
                    MoodButton(title: "Terrible", mood: $entry.mood)
                }

                // Improved Text Editor
                TextEditor(text: $entry.content)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )

                // Save Button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save Changes")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.green.opacity(0.4), radius: 5, x: 0, y: 5)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Edit Journal Entry")
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct MoodButton: View {
    let title: String
    @Binding var mood: String

    var body: some View {
        Button(action: {
            mood = title
        }) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.horizontal, 15)
                .padding(.vertical, 8)
                .background(
                    mood == title ?
                    AnyView(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.7), Color.green]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    ) : AnyView(Color.gray.opacity(0.3))
                )
                .foregroundColor(mood == title ? .white : .black)
                .cornerRadius(10)
                .shadow(color: mood == title ? Color.green.opacity(0.3) : Color.clear, radius: 5, x: 0, y: 5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


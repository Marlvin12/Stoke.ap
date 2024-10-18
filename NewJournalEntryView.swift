import SwiftUI

struct NewJournalEntryView: View {
    @Binding var journalEntries: [JournalEntry]
    @Binding var showNewEntryView: Bool
    @State private var newEntryText: String = ""
    @State private var selectedMood: String = "Awesome"
    let moods = ["Awesome", "Happy", "Okay", "Bad", "Terrible"]

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                Text("How are you feeling today?")
                    .font(.headline)
                    .padding(.top, 10)

                // Mood Picker
                HStack(spacing: 10) {
                    ForEach(moods, id: \.self) { mood in
                        moodButton(for: mood) // Using a separate function to handle the mood button
                    }
                }

                // Text Field for the journal entry
                TextField("Write your thoughts...", text: $newEntryText)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(12)
                    .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
                    .padding(.horizontal)

                // Save Entry Button
                Button(action: saveEntry) {
                    Text("Save Entry")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(saveButtonBackground) // Using a separate view for the background
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(color: Color.green.opacity(0.4), radius: 5, x: 0, y: 5)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("New Journal Entry")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        showNewEntryView = false
                    }
                }
            }
        }
    }

    // Function to create the mood button view
    private func moodButton(for mood: String) -> some View {
        Text(mood)
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(moodButtonBackground(for: mood)) // Use a helper method for background
            .foregroundColor(selectedMood == mood ? .white : .black)
            .cornerRadius(10)
            .shadow(color: selectedMood == mood ? Color.green.opacity(0.4) : Color.clear, radius: 5, x: 0, y: 5)
            .onTapGesture {
                selectedMood = mood
            }
    }

    // Helper method to provide the background for each mood button
    private func moodButtonBackground(for mood: String) -> some View {
        if selectedMood == mood {
            return AnyView(
                LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
        } else {
            return AnyView(Color.gray.opacity(0.2))
        }
    }

    // Helper method for the save button background
    private var saveButtonBackground: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    // Function to save the journal entry
    private func saveEntry() {
        guard !newEntryText.isEmpty else { return }
        let newEntry = JournalEntry(date: Date(), mood: selectedMood, content: newEntryText)
        journalEntries.append(newEntry)
        saveEntries()
        showNewEntryView = false
    }

    // Function to save journal entries to AppStorage
    private func saveEntries() {
        if let encodedEntries = try? JSONEncoder().encode(journalEntries) {
            UserDefaults.standard.set(encodedEntries, forKey: "journalEntries")
        }
    }
}


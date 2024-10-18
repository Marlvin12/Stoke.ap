import SwiftUI

struct JournalEntry: Identifiable, Codable {
    let id: UUID
    var date: Date
    var mood: String
    var content: String

    init(date: Date = Date(), mood: String, content: String) {
        self.id = UUID()
        self.date = date
        self.mood = mood
        self.content = content
    }
}

struct JournalView: View {
    @AppStorage("journalEntries") private var journalEntriesData: Data = Data()
    @State private var journalEntries: [JournalEntry] = []
    @State private var searchText: String = ""
    @State private var isShowingNewEntry = false

    var body: some View {
        NavigationStack {
            VStack {
                // Enhanced Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search Journal", text: $searchText)
                        .padding(10)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                // Filtered Journal Entries List with Card Style
                ScrollView {
                    ForEach(filteredJournalEntries) { entry in
                        NavigationLink(destination: EditJournalEntryView(entry: .constant(entry))) {
                            JournalCardView(entry: entry)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        }
                    }
                }
                .navigationTitle("Journal Entries")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            isShowingNewEntry = true
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 5)
                        }
                    }
                }
                .sheet(isPresented: $isShowingNewEntry) {
                    NewJournalEntryView(journalEntries: $journalEntries, showNewEntryView: $isShowingNewEntry)
                }
            }
        }
        .onAppear(perform: loadEntries)
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }

    private var filteredJournalEntries: [JournalEntry] {
        if searchText.isEmpty {
            return journalEntries
        } else {
            return journalEntries.filter {
                $0.mood.lowercased().contains(searchText.lowercased()) ||
                $0.content.lowercased().contains(searchText.lowercased())
            }
        }
    }

    private func loadEntries() {
        guard let decodedEntries = try? JSONDecoder().decode([JournalEntry].self, from: journalEntriesData) else { return }
        journalEntries = decodedEntries
    }

    private func saveEntries() {
        if let encodedEntries = try? JSONEncoder().encode(journalEntries) {
            journalEntriesData = encodedEntries
        }
    }

    private func deleteEntry(at offsets: IndexSet) {
        journalEntries.remove(atOffsets: offsets)
        saveEntries()
    }
}

// Custom View for Journal Card
struct JournalCardView: View {
    let entry: JournalEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(entry.mood)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)

                Spacer()
                Text(entry.date, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(entry.content)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .padding(.bottom, 5)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color(UIColor.systemGray6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
            .preferredColorScheme(.light)
        JournalView()
            .preferredColorScheme(.dark)
    }
}


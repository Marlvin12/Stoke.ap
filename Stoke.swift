import SwiftUI

import Foundation

// Define the Stoke data model
struct Stoke: Identifiable {
    let id = UUID()
    let name: String
    let participants: String
    let purpose: String
    let category: String
}

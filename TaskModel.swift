

import Foundation
import SwiftUI
import Charts

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var status: TaskStatus

    // Custom initializer to handle cases when `id` is not provided
    init(id: UUID = UUID(), title: String, status: TaskStatus) {
        self.id = id
        self.title = title
        self.status = status
    }
}

enum TaskStatus: String, CaseIterable, Codable {
    case inProgress = "In Progress"
    case completed = "Completed"
    case onHold = "On Hold"
    case toDo = "To Do"
}

import SwiftUI
import Charts

struct TaskManagerView: View {
    @AppStorage("tasks") private var tasksData: Data = Data()
    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""
    @State private var selectedStatus: TaskStatus = .toDo

    var body: some View {
        VStack(alignment: .leading) {
            // Title
            Text("Task Manager")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.leading)

            // Graph Representation of Task Status
            TaskCompletionGraph(tasks: tasks)

            // Add New Task Section
            VStack(spacing: 10) {
                TextField("Enter task title", text: $newTaskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                Picker("Status", selection: $selectedStatus) {
                    ForEach(TaskStatus.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                Button(action: addNewTask) {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)

            // Task List
            List {
                ForEach(tasks) { task in
                    TaskCardView(task: task)
                        .listRowSeparator(.hidden) // Hide separator for a cleaner look
                        .padding(.vertical, 5)
                }
                .onDelete(perform: removeTask)
            }
            .listStyle(PlainListStyle())

            Spacer()
        }
        .navigationTitle("Task Manager")
        .onAppear(perform: loadTasks)
    }

    // Function to add a new task
    private func addNewTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle, status: selectedStatus)
        tasks.append(newTask)
        newTaskTitle = "" // Clear the text field after adding a new task
        saveTasks()
    }

    // Function to remove a task
    private func removeTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        saveTasks()
    }

    // Function to load tasks from AppStorage
    private func loadTasks() {
        guard let decodedTasks = try? JSONDecoder().decode([Task].self, from: tasksData) else { return }
        tasks = decodedTasks
    }

    // Function to save tasks to AppStorage
    private func saveTasks() {
        if let encodedTasks = try? JSONEncoder().encode(tasks) {
            tasksData = encodedTasks
        }
    }
}

// Custom View for Modern Task Cards
struct TaskCardView: View {
    let task: Task

    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 5) {
                Text(task.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text(task.status.rawValue)
                    .font(.subheadline)
                    .padding(6)
                    .background(Color.white.opacity(0.2))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()

            Image(systemName: task.status == .completed ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 24))
                .foregroundColor(task.status == .completed ? .green : .white)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [taskCardColor(for: task.status).opacity(0.8), taskCardColor(for: task.status)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
        .shadow(color: taskCardColor(for: task.status).opacity(0.3), radius: 5, x: 0, y: 5)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.9) // Reduce width slightly for better aesthetics
    }

    private func taskCardColor(for status: TaskStatus) -> Color {
        switch status {
        case .inProgress:
            return Color.blue
        case .completed:
            return Color.green
        case .onHold:
            return Color.orange
        case .toDo:
            return Color.purple
        }
    }
}

// Graph to show task completion statistics
import SwiftUI
import Charts

struct TaskCompletionGraph: View {
    var tasks: [Task]

    var body: some View {
        let taskCounts = tasks.reduce(into: [TaskStatus: Int]()) { counts, task in
            counts[task.status, default: 0] += 1
        }

        let chartData = TaskStatus.allCases.map { status in
            (status.rawValue, taskCounts[status] ?? 0)
        }

        VStack {
            Text("Project Statistics")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top)

            Chart {
                ForEach(chartData, id: \.0) { (label, value) in
                    BarMark(
                        x: .value("Status", label),
                        y: .value("Count", value)
                    )
                    .foregroundStyle(by: .value("Status", label))
                    .annotation(position: .top) {
                        Text("\(value)")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                    }
                    .interpolationMethod(.catmullRom)
                }
            }
            .chartForegroundStyleScale([
                "In Progress": .blue,
                "Completed": .green,
                "On Hold": .orange,
                "To Do": .purple
            ])
            .chartXAxis {
                AxisMarks { _ in
                    AxisValueLabel()
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading) { _ in
                    AxisGridLine()
                        .foregroundStyle(Color.gray.opacity(0.3))
                    AxisValueLabel()
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                }
            }
            .chartPlotStyle { plotArea in
                plotArea
                    .background(Color(UIColor.systemGray6).opacity(0.3))
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .frame(height: 250)
            .padding()
        }
    }
}


struct TaskManagerView_Previews: PreviewProvider {
    static var previews: some View {
        TaskManagerView()
    }
}

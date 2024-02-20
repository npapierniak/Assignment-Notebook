//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Nicholas Papierniak on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItem =
    [AssignmentItem(course: "Math", description: "Do problems 1-10", dueDate: Date()),
     AssignmentItem(course: "English", description: "Read Of Mice Of Men", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Finish Lab", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItem) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text (item.course)
                                .font(.headline)
                            Text (item.description)
                        }
                        Spacer()
                        Text (item.dueDate, style: .date)
                    }
                }
                .onMove{ indices, newOffset in
                    assignmentItem.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentItem.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Assignments")
            .navigationBarItems(leading: EditButton())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct  AssignmentItem: Identifiable, Codable {
    var id = UUID ()
    var course = String()
    var description = String()
    var dueDate = Date()
}

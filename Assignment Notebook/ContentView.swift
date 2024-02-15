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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
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

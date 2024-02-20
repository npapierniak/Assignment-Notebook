//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Nicholas Papierniak on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentItem = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItem.items) { item in
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
                    assignmentItem.items.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentItem.items.remove(atOffsets: indexSet)
                }
            }
            .sheet(isPresented: $showingAddAssignmentView, content: {
                AddAssignmentView(assignmentItem: assignmentItem)
            })
            .navigationTitle("Assignments")
            .navigationBarItems (leading: EditButton (),
                                 trailing: Button(action: {
                showingAddAssignmentView = true}) {
                    Image (systemName: "plus")
                })
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

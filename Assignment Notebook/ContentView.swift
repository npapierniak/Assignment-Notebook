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
        ZStack{
            NavigationView {
                List {
                    ForEach(assignmentItem.items) { item in
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.course)
                                    .font(.headline)
                                Text(item.description)
                            }
                            .padding(8)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                    }
                    .onDelete { indexSet in
                        assignmentItem.items.remove(atOffsets: indexSet)
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
                .navigationBarItems(leading: EditButton (),trailing: Button(action: { showingAddAssignmentView = true}) {
                    Image(systemName: "plus")
                })
                .foregroundColor(.black)
            }
            .padding()
        }
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

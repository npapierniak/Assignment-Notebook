//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Nicholas Papierniak on 2/20/24.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items =
    [AssignmentItem(course: "Math", description: "Do problems 1-10", dueDate: Date()),
     AssignmentItem(course: "English", description: "Read Of Mice Of Men", dueDate: Date()),
     AssignmentItem(course: "Science", description: "Finish Lab", dueDate: Date())]
}


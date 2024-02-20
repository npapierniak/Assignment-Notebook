//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Nicholas Papierniak on 2/20/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentItem = AssignmentList()
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date ()
    @Environment (\.presentationMode) var presentationMode
    static let courses = ["Math", "English" , "Science"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach (Self.courses, id: \.self) { course in
                        Text (course)
                    }
                }
            }
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentItem: AssignmentList())
    }
}

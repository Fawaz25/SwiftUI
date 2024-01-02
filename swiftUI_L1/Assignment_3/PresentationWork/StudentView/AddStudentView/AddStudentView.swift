//
//  AddStudentView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 17/11/2023.
//

import SwiftUI

struct AddStudentView: View {
    @Binding var students: [Student]
    
    @State var name = ""
    @State var programme = ""
    @State var grade = ""
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            Group {
                TextField("Student Name", text: $name)
                TextField("Programme", text: $programme)
                TextField("Grade", text: $grade)
            }
            .padding(.horizontal)
            .textFieldStyle(.roundedBorder)
        }   
        .padding(.vertical)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add") {
                    students.append(Student(name: name,
                                            programme: programme,
                                            grade: grade))
                    mode.wrappedValue.dismiss()
                }
            }
        })
        Spacer()
    }
}

#Preview {
    AddStudentView(students: .constant([Student(name: "asd", programme: "asd", grade: "Asd")]))
}

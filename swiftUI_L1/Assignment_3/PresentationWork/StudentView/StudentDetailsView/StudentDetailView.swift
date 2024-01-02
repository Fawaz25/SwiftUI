//
//  StudentDetailView.swift
//  PresentationWork
//
//  Created by Fawaz Ahmed Tahir on 02/01/2024.
//

import Foundation
import SwiftUI

struct StudentDetailView: View {
    @State private var isEditing = false
    @State private var editedName = ""
    @State private var editedProgramme = ""
    @State private var editedGrade = ""
    @State private var labelWidth: CGFloat = 0
    
    @Binding var students: [Student]
    let student: Student
    
    var body: some View {
        VStack {
            if isEditing {
                VStack(spacing: 20) {
                    EditTextField(title: "Name:", placeholder: "Enter name here", text: $editedName)
                    EditTextField(title: "Programme:", placeholder: "Enter Programme here", text: $editedProgramme)
                    EditTextField(title: "Grade:", placeholder: "Enter Grade here", text: $editedGrade)
                    
                    Spacer()
                    VStack{
                        HStack {
                            Button("Done") {
                                updateStudent()
                                isEditing.toggle()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                            
                            Button("Discard") {
                                discardChanges()
                                isEditing.toggle() // mode.dismiss
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(8)
                        }

                        
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                   
            } else {
                
                VStack (alignment: .center) {
                    labelAndValue(for: "Name: ", value: student.name)
                    labelAndValue(for: "Programme: ", value: student.programme)
                    labelAndValue(for: "Grade: ", value: student.grade)
                    
                }
                
               

                Button(action: {
                    editedName = student.name
                    editedProgramme = student.programme
                    editedGrade = student.grade
                    isEditing.toggle()
                }) {
                    HStack(alignment: .center) {
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                        
                        Text("Edit")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                Spacer()
            }
        }
        .navigationBarTitle("Student Detail")
        .padding()
    }
    
    private func updateStudent() {
        if let index = students.firstIndex(where: { $0.id == student.id }) {
            students[index].name = editedName
            students[index].programme = editedProgramme
            students[index].grade = editedGrade
        }
    }
    
    private func discardChanges() {
        editedName = student.name
        editedProgramme = student.programme
        editedGrade = student.grade
    }
    
    func labelAndValue(for label: String, value: String) -> some View {
            HStack {
                Text(label)
                    .bold()
                    .frame( alignment: .center)
                    .padding()
                Spacer()
                Text(value)
                    .frame( alignment: .center)
                    .padding()
        }
    }
}

struct EditTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(title)")
                    .bold()
                Spacer()
            }
            TextField("\(placeholder)", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay(
            HStack {
                Spacer()
                Image(systemName: "pencil")
                    .foregroundColor(.gray)
                    .padding(.trailing)
            })
        }
    }
}

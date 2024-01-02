//
//  ContentView.swift
//  PresentationWork
//
//  Created by Aaban Tariq Murtaza on 16/11/2023.
//

import SwiftUI

struct ListView: View {
    
    @State var students = [
        Student(name: "Aaban", programme: "BS-SE", grade: "A"),
        Student(name: "Hamza", programme: "BS-CS", grade: "A")
    ]
    @State var selectedStudent: Student? = nil
    @Binding var showMenu: Bool
    
    var body: some View {
        NavigationView {
            List {
                ForEach(students) { student in
                    NavigationLink(destination: StudentDetailView(students: $students, student: student)) {
                        StudentRowView(student: student)
                            .swipeActions(edge: .leading) {
                                Button("Delete") {
                                    if let index = students.firstIndex(where: { $0.name == student.name }) {
                                        students.remove(at: index)
                                    }
                                }
                                .frame(width: 100)
                            }
                    }
                    .onTapGesture {
                        selectedStudent = student
                    }
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Menu") {
                        showMenu = true
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddStudentView(students: $students)) {
                        Text("Add Student")
                    }
                }
            })
//            .navigationTitle("Students")
        }
    }
}


struct StudentRowView: View {
    let student: Student
    let padding: CGFloat = 20
    let deleteButtonWidth: CGFloat = 100
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                VStack (alignment: .leading) {
                    Text(student.name)
                    Text(student.programme)
                }
                Spacer()
                Text(student.grade)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct Student: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var programme: String
    var grade: String
}


//#Preview {
//    ListView()
//}

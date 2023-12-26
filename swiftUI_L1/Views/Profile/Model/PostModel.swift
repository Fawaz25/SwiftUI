//
//  PostModel.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 25/12/2023.
//

import Foundation

struct ScrollableCellData: Identifiable {
    let id = UUID()
    let imageName: String
    let headerText: String
    let description: String
    let time: String
}

let postData: [ScrollableCellData] = [
    ScrollableCellData(imageName: "photo", headerText: "Header", description: "He'll want to use your yacht, and I don't want this thing smelling like fish.", time: "8m ago"),
    ScrollableCellData(imageName: "house", headerText: "Header", description: "He'll want to use your yacht, and I don't want this thing smelling like fish.", time: "8m ago"),
    ScrollableCellData(imageName: "heart", headerText: "Header", description: "He'll want to use your yacht, and I don't want this thing smelling like fish.", time: "8m ago"),
    // Add more post data as needed
]

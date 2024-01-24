//
//  cells.swift
//  swiftUI_L1
//
//  Created by Fawaz Ahmed Tahir on 26/12/2023.
//

import SwiftUI

struct ScrollableCell: View {
    let cellData: ScrollableCellData

    var body: some View {
        VStack {
            HStack(spacing: 20) {
//                Image(systemName: cellData.imageName)
                VStack{
                    Rectangle()
                    
    //                    .resizable()
                        .frame(width: 40, height: 40)
                        .padding(5)
    //                    .background(Color.gray.opacity(0.3))
                        .foregroundColor(Color(hex:"F6F6F6").opacity(1))
                
                        .cornerRadius(8)
                    Spacer()
                }
                
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack{
                        Text(cellData.headerText)
                            .font(Font.system(size: 16))
                            .font(.subheadline)
                            .bold()
                        Spacer()
                        Text(cellData.time)
//                       .font(.subheadline)
                       .font(Font.system(size: 14))
                       .foregroundColor(Color(hex:"BDBDBD"))

                       .opacity(0.6)
                    }
                   

                    Text(cellData.description)
                        .font(Font.system(size: 14))
//                        .font(.subheadline)
                        .foregroundColor(.black)
                }

            }
//            padding()
            .padding(.horizontal,10)

            .padding(.horizontal)
            GeometryReader { geometry in
                Color.gray.opacity(0.4)
                    .frame(width: 277, height: 1)
                    .offset(x: (geometry.size.width - 200) / 2, y: 10)
            }
        }
    }
}



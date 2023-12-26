import SwiftUI

let options = ["Posts", "Photos"]

struct SegmentControl: View {
    
    @State var segmentationSelection = 0 // Track the selected index

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(0..<options.count, id: \.self) { index in
                    Text(options[index])
                        .font(Font.system(size: 16))
                        .foregroundColor(segmentationSelection == index ? Color(hex:"5DB075") : Color(hex:"BDBDBD"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50) // Adjust height for the selected option
                        .background(segmentationSelection == index ?  Color.white : Color(hex:"F6F6F6"))
                        .cornerRadius(segmentationSelection == index ? 30 : 0) // Apply corner radius for selected segment
                        .clipShape(RoundedRectangle(cornerRadius: 30)) // Clip shape for individual segments
                        .onTapGesture {
                            self.segmentationSelection = index
                        }
                }
            }
            .frame(width: 343)
            .frame(height: 50)
            .background(Color(hex:"F6F6F6"))
            .cornerRadius(30) // Apply outer corner radius
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
            Spacer().frame(height:15)
            if segmentationSelection == 0 {
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(postData) { post in
                            ScrollableCell(cellData: post)
                        }
                    }
//                    .padding(.top, 20)
                }
                .background(Color.white.ignoresSafeArea())
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 300, maximum: 300))], spacing: 10) {
                        ForEach(0..<10) { _ in
//                            Image(systemName: "photo")
//                                .resizable()
                        Rectangle()
//                                .aspectRatio(contentMode: .fill)
                                .frame(width: 345, height: 240)
                                .cornerRadius(30)
                                .foregroundColor(Color.gray.opacity(0))                                .background(Color(hex:"F6F6F6").opacity(1))
                                .clipped()
                            Divider()
                                .frame(width: 277)
                                .background(Color.gray.opacity(0.4))
                                .padding(.horizontal)
                        }
                    }
                    .padding()
                }
                .background(Color.white.ignoresSafeArea())
            }
        }
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl()
    }
}

import SwiftUI

struct Dashboard: View {
//    @State private var selectedTab = 0

    var body: some View {
        NavigationView{
            
            VStack {
                // Tab bar
                TabBar()
                      
                .navigationBarHidden(false)
                .navigationBarBackButtonHidden(true)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Spacer()
                    }
                    
                ToolbarItem(placement: .principal) {
                        NavBar()
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        Spacer()
                    }
                }
            }
          
        }
    }
}



struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}

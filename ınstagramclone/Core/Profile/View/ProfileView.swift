
import SwiftUI

struct ProfileView: View {
    
    let user : User
    
    var body: some View {
  
            
        ScrollView {
                  ProfileHeaderView(user: user)
                    
                    // Grid
                  PostGridView (user: user)
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
              
            }
        
    }


// SwiftUI Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user : User.MOCK_USERS[1])
    }
}

// MARK: - LIBRARIES
import SwiftUI



struct CreditsView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        // Label("Olivier Van hamme", image: "person.fill")
        HStack {
            Text("Olivier")
            Image(systemName: "person.fill")
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS ///////////////////////////////////
struct CreditsView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        CreditsView()
    }
}

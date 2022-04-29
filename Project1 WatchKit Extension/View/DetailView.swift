// MARK: - LIBRARIES
import SwiftUI



struct DetailView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let index: Int
    let note: Note
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        Text("\(note.text)")
            .navigationTitle("Note \(index)")
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS //////////////////////////////////
struct DeatilView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        DetailView(index: 1,
                   note: Note.init(id: UUID.init(),
                                   text: "Friday"))
    }
}

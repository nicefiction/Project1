// MARK: - LIBRARIES
import SwiftUI



struct DetailView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let index: Int
    let note: Note
    let total: Int
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationLink(destination: {
            CreditsView()
        },
                       label: {
            Text("\(note.text)")
                .navigationTitle("Note \(index + 1) of \(total)")
        })
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
                                   text: "Hello 👋 World 🌍"),
                   total: 3)
    }
}

// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var notes = Array<Note>.init()
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            Text("\(notes.count) \( notes.count == 1 ? "note" : "notes")")
                .padding()
            Button("Add Note",
                   action: {
                let newNote = Note.init(id: UUID.init(),
                                        text: "Note")
                notes.append(newNote)
            })
            List {
                ForEach(0..<notes.count, id: \.self) {
                    Text("\(notes[$0].text) \($0 + 1)")
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}






// PREVIEWS ///////////////////////////////////
struct ContentView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        ContentView()
    }
}

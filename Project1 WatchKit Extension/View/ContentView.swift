// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @State private var notes = Array<Note>.init()
    @State private var text: String = ""
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            HStack {
                Text("\(notes.count) \( notes.count == 1 ? "note" : "notes")")
                    .padding()
                Button {
                    guard text.isEmpty == false
                    else { return }
                    let newNote = Note.init(id: UUID.init(),
                                            text: text)
                    notes.append(newNote)
                    text = ""
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
            }
            // .fixedSize()
            // .buttonStyle(.borderedProminent)
            .buttonStyle(BorderedButtonStyle(tint: .blue))
            List {
                ForEach(0..<notes.count, id: \.self) {
                    Text("\(notes[$0].text) \($0 + 1)")
                }
            }
            TextField("Write a new note...", text: $text)
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
